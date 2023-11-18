Feature: Registrar usuarios
Background:

  @Register_01
  Scenario: Registrar usuario
    Given url urlBase
    And path "/api/register"
    And form field email = 'john112@gmail.com'
    And form field password = '12345656'
    And form field nombre = 'john'
    And form field tipo_usuario_id = '1'
    And form field estado = '1'
    When method post
    Then status 200
    * print response
  * def authToken = response.access_token
    * print 'url:', karate.prevRequest.url
    * print 'headers:', karate.prevRequest.headers
    * print 'method:', karate.prevRequest.method

  @Register_02
  Scenario Outline: Registrar usuario masivamente <name>
    Given url urlBase
    And path "/api/register"
    And form field email = "<email>"
    And form field password = "<password>"
    And form field nombre = '<nombre>'
    And form field tipo_usuario_id = '<id>'
    And form field estado = '<estado>'
    When method post
    Then status <status>
    * print response
    * print 'url:', karate.prevRequest.url
    * print 'headers:', karate.prevRequest.headers
    * print 'method:', karate.prevRequest.method
    Examples:
      | email               | password | nombre | id | estado | status |
      | gloria121@gmail.com | 11111111 | gloria | 1  | 1      | 200    |
      | gloria112@gmail.com | 22222222 | bruno  | 1  | 1      | 200    |
      | gloria111@gmail.com | 33333333 | ana    | 1  | 1      | 200    |


  @Register_03
  Scenario Outline: Registrar usuario masivamente
    * def bodyUser = read('classpath:resources/json/users.json')
    Given url urlBase
    And path "/api/register"
    And request bodyUser
    When method post
    Then status 200
    * print response
    * print 'url:', karate.prevRequest.url
    * print 'headers:', karate.prevRequest.headers
    * print 'method:', karate.prevRequest.method
    Examples:
    |read ('classpath:resources/csv/dataUsers.csv')|


  @Register_04
  Scenario: Unhappy path de usuario registrado anteriormente
    Given url urlBase
    And path "/api/register"
    And form field email = 'john1@gmail.com'
    And form field password = '12345656'
    And form field nombre = 'john'
    And form field tipo_usuario_id = '1'
    And form field estado = '1'
    When method post
    Then status 500
    * print response
    * print 'url:', karate.prevRequest.url
    * print 'headers:', karate.prevRequest.headers
    * print 'method:', karate.prevRequest.method




