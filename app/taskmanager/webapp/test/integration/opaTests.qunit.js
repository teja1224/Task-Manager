sap.ui.require(
    [
        'sap/fe/test/JourneyRunner',
        'ns/taskmanager/test/integration/FirstJourney',
		'ns/taskmanager/test/integration/pages/TasksList',
		'ns/taskmanager/test/integration/pages/TasksObjectPage'
    ],
    function(JourneyRunner, opaJourney, TasksList, TasksObjectPage) {
        'use strict';
        var JourneyRunner = new JourneyRunner({
            // start index.html in web folder
            launchUrl: sap.ui.require.toUrl('ns/taskmanager') + '/index.html'
        });

       
        JourneyRunner.run(
            {
                pages: { 
					onTheTasksList: TasksList,
					onTheTasksObjectPage: TasksObjectPage
                }
            },
            opaJourney.run
        );
    }
);