Feature: Persistence
  
  To know whether it's worth posting
  We need too see who's online right now
  
  Scenario: Posts persist between reloads
    Given Josh has logged in
    And Adrian has logged in
    Then Josh should see Adrian's avatar
    And Adrian should see Josh's avatar
    And Josh should see Josh's avatar
    And Adrian should see Adrian's avatar
    When Josh disconnects
    Then Adrian should not see Josh's avatar