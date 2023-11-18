Feature: Consultar productos

  Background:
    * def response =  call read('classpath:bdd/auth/loginAuth.feature@login_01')
    * def token = response.authToken
    * header Authorization = "Bearer " +token
    * header Accept = "application/json"

  @getproducto_01
  Scenario: Consultar todos los productos
    Given url urlBase
    And path "/api/v1/producto"
    When method get
    Then status 200
    * print response
    * print 'url:', karate.prevRequest.url
    * print 'headers:', karate.prevRequest.headers
    * print 'method:', karate.prevRequest.method


  @getproducto_02
  Scenario: Consultar producto por id
    * def idprod = 2
    Given url urlBase
    And path "/api/v1/producto/" + idprod
    When method get
    Then status 200
    * print response
    * print 'url:', karate.prevRequest.url
    * print 'headers:', karate.prevRequest.headers
    * print 'method:', karate.prevRequest.method


  @getproducto_03
  Scenario Outline: Consultar producto por id <id>
    * def idprod = <id>
    Given url urlBase
    And path "/api/v1/producto/" + idprod
    When method get
    Then status 200
    * print response
    * print 'url:', karate.prevRequest.url
    * print 'headers:', karate.prevRequest.headers
    * print 'method:', karate.prevRequest.method
    Examples:
      |id|
      |1 |
      |2 |
      |3 |

  @getproducto_04
  Scenario: Consultar producto con id no existente
    * def idprod = 20000000
    Given url urlBase
    And path "/api/v1/producto/" + idprod
    When method get
    Then status 404
    * print response
    * print 'url:', karate.prevRequest.url
    * print 'headers:', karate.prevRequest.headers
    * print 'method:', karate.prevRequest.method

