sap.ui.require(
    [
        'sap/fe/test/JourneyRunner',
        'ust/webapp/test/integration/FirstJourney',
		'ust/webapp/test/integration/pages/Request_HeaderList',
		'ust/webapp/test/integration/pages/Request_HeaderObjectPage',
		'ust/webapp/test/integration/pages/Request_ItemsObjectPage'
    ],
    function(JourneyRunner, opaJourney, Request_HeaderList, Request_HeaderObjectPage, Request_ItemsObjectPage) {
        'use strict';
        var JourneyRunner = new JourneyRunner({
            // start index.html in web folder
            launchUrl: sap.ui.require.toUrl('ust/webapp') + '/index.html'
        });

       
        JourneyRunner.run(
            {
                pages: { 
					onTheRequest_HeaderList: Request_HeaderList,
					onTheRequest_HeaderObjectPage: Request_HeaderObjectPage,
					onTheRequest_ItemsObjectPage: Request_ItemsObjectPage
                }
            },
            opaJourney.run
        );
    }
);