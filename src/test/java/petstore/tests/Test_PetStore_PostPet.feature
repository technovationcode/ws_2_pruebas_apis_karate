Feature: Post a record of a Pet in Pet Store

@SimpleCreatePet
Scenario: Create a record for a dog in the pet store
	#Given url URL_REST + SVC_PET
	Given url 'https://petstore.swagger.io/v2/pet'
	And request read('postDog_Payload.json')
	When method post
	Then status 200
	And match response.id == 102
	And match response.category.name == 'Dog'
	And match response.status == 'available'
	
	
@CreateTwoPets
Scenario Outline: Create a record for a <scenario> in the pet store
	#Given url URL_REST + SVC_PET
	Given url 'https://petstore.swagger.io/v2/pet'
	And request read(<payload>)
	When method post
	Then status 200
	And match response.id == <id>
	And match response.category.name == <scenario>
	And match response.status == 'available'
	
Examples:
    | scenario | id | payload                |
    | 'Dog'    | 102 | 'postDog_Payload.json' |
    | 'Cat'    | 101 | 'postCat_Payload.json' |       
	

@UseConfigFiles
Scenario: Create a record for a dog in the pet store using URL from Config Files
	Given url URL_PetStore + SVC_PET
	And request read('postDog_Payload.json')
	When method post
	Then status 200
	And match response.id == 102
	And match response.category.name == 'Dog'
	And match response.status == 'available'
	
	
@SchemaValidations
Scenario: Create a record for a dog in the pet store using URL from Config Files
	Given url URL_PetStore + SVC_PET
	And request read('postDog_Payload.json')
	When method post
	Then status 200
	And match response.id == 102
	And match response == {"id":102,"category":{"id":2,"name":"Dog"},"name":"Doggies","photoUrls":["http://mycdogphotos.com"],"tags":[{"id":2,"name":"Doggies"}],"status":"available"}
	And match response == {"id":'#number',"category":{"id":'#number',"name":'#string'},"name":'#string',"photoUrls":["http://mycdogphotos.com"],"tags":[{"id":'#number',"name":'#string'}],"status":'#string'}	
	#And match response == {"id":'#string',"category":{"id":'#number',"name":'#string'},"name":'#string',"photoUrls":["http://mycdogphotos.com"],"tags":[{"id":'#number',"name":'#string'}],"status":'#string'}	