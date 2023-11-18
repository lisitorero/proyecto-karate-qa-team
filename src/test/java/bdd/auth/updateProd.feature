Feature: Actualizar productos

  Background:
    * def response =  call read('classpath:bdd/auth/loginAuth.feature@login_01')
    * def token = response.authToken
    * header Authorization = "Bearer " +token
    * header Accept = "application/json"

  @updateProd_01
  Scenario: Actualizar producto por id
    * def idprod = 82
    Given url urlBase
    And path "/api/v1/producto/" + idprod
    And request
    """
 	 {
        "id": 82,
        "codigo": "PRO082",
        "nombre": "PI?ON CADENA LEVAS PL200NS",
        "medida": "UND",
        "precio": "8.00",
        "stock": "51",
        "descripcion": "PI?ON CADENA LEVAS PL200NS",
        "categoria": "Repuestos",
        "marca": "Generico",
        "estado": "1"
        }
    """
    When method PUT
    Then status 200
    * print response
    * print 'url:', karate.prevRequest.url
    * print 'headers:', karate.prevRequest.headers
    * print 'method:', karate.prevRequest.method



  @updateProd_02
  Scenario Outline: Actualizar por <id>
    Given url urlBase
    And path "/api/v1/producto/" + <id>
    And request
    """
    {
    	"id": "#(id)",
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
    When method PUT
    Then status 200
    * print response
    * print 'url:', karate.prevRequest.url
    * print 'headers:', karate.prevRequest.headers
    * print 'method:', karate.prevRequest.method
    Examples:
      | id | codigo | nombre     | medida | marca    | categoria | precio | stock | estado | descripcion |
      | 82 | PR0082 | ALTERNADOR | UND    | GENERICO | REPUESTOS | 35.00  | 40    | 3      | ALTERNADOR  |


  @updateProd_03
  Scenario Outline: Actualizar productos por id: <id>
    * def bodyUpdateProd = read('classpath:resources/json/bodyUpdateProducto.json')
    Given url urlBase
    And path "/api/v1/producto/" + <id>
    And request bodyUpdateProd
    When method PUT
    Then status 200
    * print response
    * print 'url:', karate.prevRequest.url
    * print 'headers:', karate.prevRequest.headers
    * print 'method:', karate.prevRequest.method
    Examples:
      | id | codigo | nombre     | medida | marca    | categoria | precio | stock | estado | descripcion |
      | 82 | PR0082 | ALTERNADOR | UND    | GENERICO | REPUESTOS | 35.00  | 40    | 3      | ALTERNADOR  |
      | 83 | PRO083 | ALTERNADOR | UND    | GENERICO | REPUESTOS | 35.00  | 40    | 3      | ALTERNADOR  |

  @updateProd_04
  Scenario Outline: Actualizar productos por id: <id>
    * def bodyUpdateProd = read('classpath:resources/json/bodyUpdateProducto.json')
    Given url urlBase
    And path "/api/v1/producto/" + <id>
    And request bodyUpdateProd
    When method PUT
    Then status 200
    * print response
    * print 'url:', karate.prevRequest.url
    * print 'headers:', karate.prevRequest.headers
    * print 'method:', karate.prevRequest.method
    Examples:
      |  read ('classpath:resources/csv/dataUpdateProd.csv')   |

  @updateProd_05
  Scenario: Unhappypath - Actualizar producto con id no existente
    * def idprod = 100000
    Given url urlBase
    And path "/api/v1/producto/" + idprod
    And request
    """
 	 {
        "id": 1000000,
        "codigo": "PRO082",
        "nombre": "PI?ON CADENA LEVAS PL200NS",
        "medida": "UND",
        "precio": "8.00",
        "stock": "51",
        "descripcion": "PI?ON CADENA LEVAS PL200NS",
        "categoria": "Repuestos",
        "marca": "Generico",
        "estado": "1"
        }
    """
    When method PUT
    Then status 500
    * print response
    * print 'url:', karate.prevRequest.url
    * print 'headers:', karate.prevRequest.headers
    * print 'method:', karate.prevRequest.method





