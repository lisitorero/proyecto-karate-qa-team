Feature: Añadir productos

  Background:
    * def response =  call read('classpath:bdd/auth/loginAuth.feature@login_01')
    * def token = response.authToken
    * header Authorization = "Bearer " +token
    * header Accept = "application/json"



  @logout_01
  Scenario: Logout de usuario con login correcto
    Given url urlBase
    And path "/api/logout"
    When method GET
    Then status 200
    * print response
    * def authToken = response.access_token
    * print authToken
    * print 'url:', karate.prevRequest.url
    * print 'headers:', karate.prevRequest.headers
    * print 'method:', karate.prevRequest.method
