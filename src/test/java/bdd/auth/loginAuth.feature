Feature: Inicio de Sesion


  @login_01
  Scenario: Login de usuario registrado correctamente
    Given url urlBase
    And path "/api/login"
    And request { "email": "carlosz@gmail.com","password": "12345678"}
    When method post
    Then status 200
    * print response
    * def authToken = response.access_token
    * print authToken
    * print 'url:', karate.prevRequest.url
    * print 'headers:', karate.prevRequest.headers
    * print 'method:', karate.prevRequest.method


  @login_02
  Scenario Outline: Login de usuario registrado correctamente_2
    Given url urlBase
    * def bodyUser = read('classpath:resources/json/bodyLogin.json')
    And path "/api/login"
    And request bodyUser
    When method post
    Then status 200
    * print response
    * def authToken = response.access_token
    * print authToken
    * print 'url:', karate.prevRequest.url
    * print 'headers:', karate.prevRequest.headers
    * print 'method:', karate.prevRequest.method
    Examples:
      | read ('classpath:resources/csv/dataLogin.csv') |


  @login_03
  Scenario: Login de usuario con credenciales invalidas
    Given url urlBase
    And path "/api/login"
    And request { "email": "carlosz@gmail.com","password": "11111111"}
    When method post
    Then status 401
    * print response
    * print 'url:', karate.prevRequest.url
    * print 'headers:', karate.prevRequest.headers
    * print 'method:', karate.prevRequest.method

