Feature: Persistence
  
  To avoid missing stuff when we're offline
  We need posts to be persisted
  
  Scenario: Posts persist between reloads
    Given I have logged in
    When I post a message
    And I reload my client
    Then I should see the message I posted