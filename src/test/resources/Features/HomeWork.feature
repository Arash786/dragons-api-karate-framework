Feature: Account verify Test

  Background: Setup Test URL
    Given url "https://tek-insurance-api.azurewebsites.net"

  Scenario: Get Account API Call with existing account
    And path "/api/token"
    And request {"username": "supervisor","password": "tek_supervisor"}
    When method post
    Then status 200
    And print response
    # def step to define new variable in Karate Framwork
    * def generatedToken = response.token
    Given path "/api/accounts/get-account"
    And param primaryPersonId = 6834
    And header Authorization = "Bearer " + generatedToken
    When method get
    Then status 200
    And print response
    And assert response.primaryPerson.id == 6834
    And assert response.primaryPerson.email == "ArasshPjrr@gmail.com"
