@ignore
Feature: Functionalities for Cards section in Trello

Scenario: Post Card
	Given url URL_Trello + SVC_CARDS
	And params { key: '#(APPKEY)', token: '#(TOKEN)'}
	And request payload
	When method post

	