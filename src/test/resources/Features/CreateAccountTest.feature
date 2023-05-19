Feature: Create an Account

  Background: API Test 
    * def result = callonce read('GenerateToken.feature')
    And print result
    * def generatedToken = result.response.token
    Given url "https://tek-insurance-api.azurewebsites.net"

  Scenario: Create Account Test
    Given path "/api/accounts/add-primary-account"
    And header Authorization = "Bearer " + generatedToken
    And request
      """
      {
      "email": "AarrashPjrr@gmail.com",
      "firstName": "Arrash",
      "lastName": "Pjr",
      "title": "Mr",
      "gender": "MALE",
      "maritalStatus": "SINGLE",
      "employmentStatus": "Software Tester",
      "dateOfBirth": "1990-01-01",
      
      }
      """
    When method post
    Then status 201
    Then print response
    And assert response.email == "AarrashPjrr@gmail.com"
    #Delete created account
    Given path "/api/accounts/delete-account"
    And header Authorization = "Bearer " + generatedToken
    And param primaryPersonId = response.id
    When method delete
    Then status 200
    And print response
    And assert response == "Account Successfully deleted"
