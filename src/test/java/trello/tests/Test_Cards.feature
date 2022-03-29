Feature: Functionalities for Cards section in Trello

@CreateCard
Scenario: Create a Card
	Given url URL_Trello + SVC_CARDS
	And params { key: '#(APPKEY)', token: '#(TOKEN)'}
	And request read('postCard_Payload.json')
	When method post
	Then status 200
	And def cardId = response.id
	* print cardId
	
@DeleteCard
Scenario: Delete a Card
	Given url URL_Trello + SVC_CARDS + '/6203e614feef488f8b27d63e'
	And params { key: '#(APPKEY)', token: '#(TOKEN)'}
	When method delete
	Then status 200
	
@CreateDeleteCard
Scenario: Create and Delete Feature
  #Create a Card
  Given def payloadCard = read('postCard_Payload.json')
#	When def post = call read('classpath:trello/operations/postCard.feature') { payload : '#(payloadCard)' }
	When def post = call read(PATH_TRELLO_OPS + 'postCard.feature') { payload : '#(payloadCard)' }	
  Then match post.responseStatus == 200
	#Save the ID
	And def cardId = post.response.id
	#Print response and id
	* print post.response
	* print post.response.id
	
	#Wait for sometime for the example
	* def makePause = function(pause){ java.lang.Thread.sleep(pause) }
	* def pause = makePause(7000)
		
	#Delete the created card using the ID
	Given print cardId
	When def delete = call read(PATH_TRELLO_OPS + 'deleteCard.feature') { CardId : '#(cardId)' }	
  Then match delete.responseStatus == 200

@MatchFunctionality
Scenario: Example to show some match types
  #Create a Card
  Given def payloadCard = read('postCard_Payload.json')
	When def post = call read(PATH_TRELLO_OPS + 'postCard.feature') { payload : '#(payloadCard)' }
  Then match post.responseStatus == 200
	#Save the ID
	And def cardId = post.response.id
	#Print response and id
	* print post.response
	* print post.response.id
		
	When def get = call read(PATH_TRELLO_OPS + 'getCard.feature') { CardId : '#(cardId)' }	
  Then match get.responseStatus == 200

	#Print response and id
	* print get.response
	* print get.response.id	

	* match get.response.id == cardId
	* match get.responseStatus != 404
	* match get.response contains { closed : false }
	* match get.response !contains { other : true }

	#Wait for sometime for the example
	* def makePause = function(pause){ java.lang.Thread.sleep(pause) }
	* def pause = makePause(7000)
		
	#Delete the created card using the ID
	Given print cardId
	When def delete = call read(PATH_TRELLO_OPS + 'deleteCard.feature') { CardId : '#(cardId)' }	
  Then match delete.responseStatus == 200  

@CallJava
Scenario: Example to show how to call a java function
Given def javaDate = Java.type('utils.GetDateTime') 
And print javaDate.addDaysToDate_yyyymmdd(2)
	
@CallJS
Scenario: Call Java Script
Given def word = call read('classpath:utils/toUpperCase.js') 'quality engineering' 
And print word


@JsonPathFilter
Scenario: Json Path Filter
Given def word = call read('classpath:utils/toUpperCase.js') 'quality engineering' 
And print word



  