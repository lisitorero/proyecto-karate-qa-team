Feature: Añadir producto

  Background:
    * def response =  call read('classpath:bdd/auth/loginAuth.feature@login_01')
    * def token = response.authToken
    * header Authorization = "Bearer " +token
    * header Accept = "application/json"


  @producto_01
  Scenario: Aqregando producto nuevo_2
    Given url urlBase
    And path "/api/v1/producto"
    And request
    """
    {
    "codigo": "TC0058",
    "nombre": "ALTERNADOR PL200NS",
    "medida": "UND ",
    "marca": "Generico",
    "categoria": "Repuestos",
    "precio": "35.00",
    "stock": "48",
    "estado": "3",
    "descripcion": "ALTERNADOR PL200NS"
    }
    """
    When method post
    Then status 200
    * print response
    * print 'url:', karate.prevRequest.url
    * print 'headers:', karate.prevRequest.headers
    * print 'method:', karate.prevRequest.method

  @producto_02
  Scenario Outline: Aqregando producto nuevo_02 <id> <nombre>
    * def bodyProd = read('classpath:resources/json/bodyProducto.json')
    Given url urlBase
    And path "/api/v1/producto"
    And request bodyProd
    When method post
    Then status 200
    * print response
    * print 'url:', karate.prevRequest.url
    * print 'headers:', karate.prevRequest.headers
    * print 'method:', karate.prevRequest.method
    Examples:
      |read ('classpath:resources/csv/dataProd.csv')|






