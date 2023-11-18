Feature: Actualizar estado de productos

  Background:
    * def response =  call read('classpath:bdd/auth/loginAuth.feature@login_01')
    * def token = response.authToken
    * header Authorization = "Bearer " +token
    * header Accept = "application/json"

  @pathProd_01
  Scenario: Actualizar producto por id
    * def idprod = 82
    Given url urlBase
    And path "/api/v1/producto/" + idprod
    And request
    """
 	 {
        "estado": 3
      }
    """
    When method PATCH
    Then status 200
    * print response
    * print 'url:', karate.prevRequest.url
    * print 'headers:', karate.prevRequest.headers
    * print 'method:', karate.prevRequest.method




  @patchProd_02
  Scenario Outline: Actualizar por <id>
    Given url urlBase
    And path "/api/v1/producto/" + <id>
    And request
    """
    {
     "estado": "#(estado)"
     }
    """
    When method PATCH
    Then status 200
    * print response
    * print 'url:', karate.prevRequest.url
    * print 'headers:', karate.prevRequest.headers
    * print 'method:', karate.prevRequest.method
    Examples:
      | id | estado|

      | 82 |  2    |

  @patchProd_03
  Scenario Outline: Actualizar productos por id: <id>
    * def bodyPatchProd = read('classpath:resources/json/bodyPatchProducto.json')
    Given url urlBase
    And path "/api/v1/producto/" + <id>
    And request bodyPatchProd
    When method PATCH
    Then status 200
    * print response
    * print 'url:', karate.prevRequest.url
    * print 'headers:', karate.prevRequest.headers
    * print 'method:', karate.prevRequest.method
    Examples:
      | id | estado |
      | 82 | 2      |
      | 83 | 3      |


  @patchProd_04
  Scenario Outline: Actualizar productos por id: <id>
    * def bodyPatchProd = read('classpath:resources/json/bodyPatchProducto.json')
    Given url urlBase
    And path "/api/v1/producto/" + <id>
    And request bodyPatchProd
    When method PATCH
    Then status 200
    * print response
    * print 'url:', karate.prevRequest.url
    * print 'headers:', karate.prevRequest.headers
    * print 'method:', karate.prevRequest.method
    Examples:
      |  read ('classpath:resources/csv/dataPatchProd.csv')   |


  @patchProd_05
  Scenario Outline: Unhappypath - Actualizar por <id> no validos
    Given url urlBase
    And path "/api/v1/producto/" + <id>
    And request
    """
    {
     "estado": "#(estado)"
     }
    """
    When method PATCH
    Then status 500
    * print response
    * print 'url:', karate.prevRequest.url
    * print 'headers:', karate.prevRequest.headers
    * print 'method:', karate.prevRequest.method
    Examples:
      | id  	| estado|

      | 100000 |  2    |