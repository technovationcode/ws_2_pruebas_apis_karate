@ignore
Feature: Obtain a card

Scenario: Get a Card
	Given url URL_Trello + SVC_CARDS + '/' + CardId 
	And params { key: '#(APPKEY)', token: '#(TOKEN)'}
	When method get

	