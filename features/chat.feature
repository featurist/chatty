Feature: Chat

  To work effectively as a geographically distributed team
  We're going to need chat tools that are just right, for us

  Scenario: Two Featurists having a chat
    Given Josh has logged in
    And Adrian has logged in
    When Josh posts a message
    Then Adrian should see Josh's message
    And Josh should see Josh's message
