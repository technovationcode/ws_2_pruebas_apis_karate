function  fn() {    
	  var env = karate.env; // get java system property 'karate.env'
	  karate.log('karate.env system property was:', env);
	  
	if (!env) {
		env = 'DEV';
	} 
	
	var config; 			
	config=karate.read('classpath:configs/globalVariables.json');
	config.myEndPoints = karate.read('classpath:configs/endPoints.json');

	if (env == 'DEV') {
		config.URL_PetStore = config.myEndPoints.DEV.URL_PetStore;
		config.URL_Trello = config.myEndPoints.DEV.URL_Trello;		
		} 
	else if (env == 'TEST') {
		config.URL_PetStore = config.myEndPoints.TEST.URL_PetStore;
		config.URL_Trello = config.myEndPoints.TEST.URL_Trello;				
		} 
	else if (env == 'UAT'){
		config.URL_PetStore = config.myEndPoints.UAT.URL_PetStore;	
		config.URL_Trello = config.myEndPoints.UAT.URL_Trello;				
	  	}

	  // don't waste time waiting for a connection or if servers don't respond within 5 seconds
	karate.configure('connectTimeout', 5000);
	karate.configure('readTimeout', 5000);
	karate.log("myconfig "+config);	   		
	return config;
}