const cds = require('@sap/cds');

module.exports = cds.service.impl(async function (srv) {

    const prod_api = await cds.connect.to('OP_API_PRODUCT_SRV_0001');
    
    // Destructure the entities from the service
    const { materials ,Request_Header , REQUEST_HEADER_DRAFTS } = srv.entities;
    
    // Define the READ event for the 'materials' entity
    srv.on("READ", materials, async (req) => {
        try {
            // Add filtering to the query
            req.query.where("Product <> '' ");
            req.query.SELECT.count = false; // Ensuring no count is added to the query
            
            // Log the query being executed for debugging
            console.log("Running query:");

            // Send the query to the destination
            const response = await prod_api.run(req.query);
            
            // Log the response from the destination (or error if not received)
            console.log("Response from prod_api:");

            return response;

        } catch (error) {
            // Log and handle any errors during the process
            console.error("Error occurred while querying the external service:", error);

            // Optionally, you can rethrow or handle the error as needed
            throw new Error("Failed to retrieve data from the external service.");
        }
    });
    srv.before('CREATE', Request_Header, async (req) => {
        const { maxNumber } = await SELECT.one`max(RequestNo) as maxNumber`.from(Request_Header)
        let iNewNo = (!maxNumber ? 1000000000 : Number(maxNumber) + 1);
        req.data.RequestNo = iNewNo;
         // Increment for next request
    });
    srv.before('NEW',REQUEST_HEADER_DRAFTS,async(req)=>{
        const { maxNumber } = await SELECT.one`max(RequestNo) as maxNumber`.from(Request_Header)
        let iNewNo = (!maxNumber ? 1000000000 : Number(maxNumber) + 1);
        req.data.RequestNo = iNewNo;
    })
});
