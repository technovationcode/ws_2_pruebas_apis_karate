@ignore
Feature: Delete Card

Scenario: Delete Card
	Given url URL_Trello + SVC_CARDS + '/' + CardId
	And params { key: '#(APPKEY)', token: '#(TOKEN)'}
	When method delete