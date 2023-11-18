Feature: Cambio de contraseña

  Background:
    * def response =  call read('classpath:bdd/auth/loginAuth.feature@login_01')
    * def token = response.authToken
    * header Authorization = "Bearer " +token
    * header Accept = "application/json"

  @changePass_01
  Scenario: Cambiar contraseña de un usuario
    Given url urlBase
    And path "/api/reset-password"
    And request { "email": "john112@gmail.com","new_password": "12345656"}
    When method post
    Then status 201
    * print response
    * def authToken = response.access_token
    * print authToken
    * print 'url:', karate.prevRequest.url
    * print 'headers:', karate.prevRequest.headers
    * print 'method:', karate.prevRequest.method


  @changePass_02
  Scenario Outline: Cambiar de contraseña de usuario
    Given url urlBase
    * def bodyUser = read('classpath:resources/json/bodyNewPass.json')
    And path "/api/reset-password"
    And request bodyUser
    When method post
    Then status 201
    * print response
    * def authToken = response.access_token
    * print authToken
    * print 'url:', karate.prevRequest.url
    * print 'headers:', karate.prevRequest.headers
    * print 'method:', karate.prevRequest.method
    Examples:
      | read ('classpath:resources/csv/dataNewPass.csv') |

  @changePass_03
  Scenario: Cambio de contraseña de usuario invalido
    Given url urlBase
    And path "/api/reset-password"
    And request { "email": "carlossz@gmail.com","new_password": "11111111"}
    When method post
    Then status 404
    * print response
    * print 'url:', karate.prevRequest.url
    * print 'headers:', karate.prevRequest.headers
    * print 'method:', karate.prevRequest.method