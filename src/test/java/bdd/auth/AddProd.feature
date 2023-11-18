Feature: Añadir productos

  Background:
    * def response =  call read('classpath:bdd/auth/loginAuth.feature@login_01')
    * def token = response.authToken
    * header Authorization = "Bearer " +token
    * header Accept = "application/json"


  @addProduct_01
  Scenario: Añadir un producto
    Given url urlBase
    And path "/api/v1/producto"
    And request
    """
    {
    "codigo": "TC0115",
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
    When method POST
    Then status 200
    * print response
    * print 'url:', karate.prevRequest.url
    * print 'headers:', karate.prevRequest.headers
    * print 'method:', karate.prevRequest.method

  @addProduct_02
  Scenario Outline: Añadir un producto
    Given url urlBase
    And path "/api/v1/producto"
    And request
    """
    {
	  "codigo": "#(codigo)",
	  "nombre": "#(nombre)",
	  "medida": "#(medida)",
	  "marca": "#(marca)",
	  "categoria": "#(categoria)",
	  "precio": "#(precio)",
	  "stock": "#(stock)",
	  "estado": "#(estado)",
	  "descripcion": "#(descripcion)"
	}
    """
    When method POST
    Then status 200
    * print response
    * print 'url:', karate.prevRequest.url
    * print 'headers:', karate.prevRequest.headers
    * print 'method:', karate.prevRequest.method
    Examples:
      | codigo | nombre     | medida | marca    | categoria | precio | stock | estado | descripcion |
      | TC0144 | ALTERNADOR | UND    | GENERICO | REPUESTOS | 35.00  | 40    | 3      | ALTERNADOR  |
      | TC0142 | ALTERNADOR | UND    | GENERICO | REPUESTOS | 35.00  | 40    | 3      | ALTERNADOR  |


  @addProduct_03
  Scenario Outline: Añadir productos <codigo>
    * def bodyProd = read('classpath:resources/json/bodyProducto.json')
    Given url urlBase
    And path "/api/v1/producto"
    And request bodyProd
    When method POST
    Then status 200
    * print response
    * print 'url:', karate.prevRequest.url
    * print 'headers:', karate.prevRequest.headers
    * print 'method:', karate.prevRequest.method
    Examples:
      | codigo | nombre     | medida | marca    | categoria | precio | stock | estado | descripcion |
      | TC0120 | ALTERNADOR | UND    | GENERICO | REPUESTOS | 35.00  | 40    | 3      | ALTERNADOR  |
      | TC0121 | ALTERNADOR | UND    | GENERICO | REPUESTOS | 35.00  | 40    | 3      | ALTERNADOR  |


  @addProduct_04
  Scenario Outline: Añadir productos masivamente <codigo>
    * def bodyProd = read('classpath:resources/json/bodyProducto.json')
    Given url urlBase
    And path "/api/v1/producto"
    And request bodyProd
    When method POST
    Then status 200
    * print response
    * print 'url:', karate.prevRequest.url
    * print 'headers:', karate.prevRequest.headers
    * print 'method:', karate.prevRequest.method
    Examples:
      | read ('classpath:resources/csv/dataProd.csv') |


  @addProduct_05
  Scenario: Unhappy path_Añadir un producto con codigo ya existente
    Given url urlBase
    And path "/api/v1/producto"
    And request
    """
    {
    "codigo": "TC0115",
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
    When method POST
    Then status 500
    * print response
    * print 'url:', karate.prevRequest.url
    * print 'headers:', karate.prevRequest.headers
    * print 'method:', karate.prevRequest.method
