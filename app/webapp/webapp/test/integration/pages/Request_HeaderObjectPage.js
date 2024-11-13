sap.ui.define(['sap/fe/test/ObjectPage'], function(ObjectPage) {
    'use strict';

    var CustomPageDefinitions = {
        actions: {},
        assertions: {}
    };

    return new ObjectPage(
        {
            appId: 'ust.webapp',
            componentId: 'Request_HeaderObjectPage',
            contextPath: '/Request_Header'
        },
        CustomPageDefinitions
    );
});