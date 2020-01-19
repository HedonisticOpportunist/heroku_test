@heroku_app

Feature: Heroku App Feature
  Description: Testing of the Heroku App Computer database

  Background:
    Given I am on the computer database main page

  Scenario Outline: Create a new computer record
    I want to add a new computer
    When I add a new computer
    And I add its "<name>", "<introduction_date>" "<discontinued_date>" and its "<company_name>"
    And I click on the create button
    Then a message should be displayed that the computer "<name>" has been created

    Examples:
      | name         | introduction_date | discontinued_date | company_name |
      | Siemens      | 1982-11-02        | 1989-01-05        | Sony         |
      | n!!X 0       | 1990-10-06        | 2002-11-06        | Atari        |
      | Apple Newton |                   |                   | Canon        |
      | ARRA         |                   |                   | Nokia        |

  Scenario Outline: Retrieving a previously created computer and comparing its details with
  expected input
    I want to retrieve a computer that was created previously
    When I search for a computer using its "<name>"
    Then its "<name>", "<introduction_date>" and "<discontinued_date>" should match the test input

    Examples:
      | name    | introduction_date | discontinued_date |
      | Siemens | 1982-11-02        | 1989-01-05        |
      | n!!X 0  | 1990-10-06        | 2002-11-06        |
      | ARRA    |                   |                   |

  Scenario Outline: Creating a computer record and then deleting it
    I want to create a computer and then delete it
    Given I create a record with the details "<name>", "<introduction_date>" "<discontinued_date>" and "<company_name>"
    And I search for a computer using its "<name>"
    When I click on the delete button
    Then a message should be displayed that the computer has been deleted

    Examples:
      | name      | introduction_date | discontinued_date | company_name |
      | LaraJean  | 1983-06-13        | 1993-09-12        | IBM          |
      | WOLVERINE | 1999-01-01        | 2005-10-05        | Nintendo     |

  Scenario Outline: Creating a computer record and then updating it
    I want to create a computer and then update its details
    Given I create a record with the details "<name>", "<introduction_date>" "<discontinued_date>" and "<company_name>"
    And I search for a computer using its "<name>"
    When I update its name to "<amended_name>"
    And click on the save button
    Then a message should be displayed that the computer "<amended_name>" has been updated

    Examples:
      | name      | introduction_date | discontinued_date | company_name | amended_name |
      | Akira     | 1981-07-11        | 1994-08-10        | Xerox        | WILLIAMS     |
      | WOLVERINE | 1997-02-01        | 2004-10-07        | Nokia        | BATX01       |

  Scenario Outline: Creating a computer record with invalid dates
    I want to create a computer with invalid dates
    When I add a new computer
    And I add its "<name>", "<introduction_date>" "<discontinued_date>" and its "<company_name>"
    And I click on the create button
    Then an error message should be displayed

    Examples:
      | name | introduction_date | discontinued_date | company_name      |
      | x    | 1990              | 2002              | Thinking Machines |
      | t    | 1                 | 1                 | Cray              |

  Scenario Outline: Searching for a computer record that does not exist
    I want to search for a computer that does not exist
    When I search for a computer using an invalid "<name>"
    Then I should get a message that no computers have been found

    Examples:
      | name     |
      | F!!!!!   |
      | -----    |
      | %%%%%$$$ |

  Scenario Outline: Searching for an existing record and deleting it
    I want to search for a computer and then delete it
    When I search for a computer using its "<name>"
    And I click on the delete button
    Then a message should be displayed that the computer has been deleted

    Examples:
      | name         |
      | Apple Newton |

  Scenario Outline: Searching for an existing record and updating it
    I want to search for a computer and update its details
    When I search for a computer using its "<name>"
    And I update its name to "<amended_name>"
    And click on the save button
    Then a message should be displayed that the computer "<amended_name>" has been updated

    Examples:
      | name | amended_name |
      | ARRA | Apple        |

  Scenario Outline: Creating a record without entering the computer name
    I want to create a computer without entering its name
    When I add a new computer
    And I add its "<name>", "<introduction_date>" "<discontinued_date>" and its "<company_name>"
    And I click on the create button
    Then an error message should be displayed

    Examples:
      | name | introduction_date | discontinued_date | company_name |
      |      |                   |                   | IBM          |

  Scenario Outline: Creating a record without adding the company
    I want to create a computer without adding the company
    When I add a new computer
    And I update its name to "<name>"
    And I click on the create button
    Then a message should be displayed that the computer "<name>" has been created

    Examples:
      | name      |
      | Wonderful |
      | x         |
