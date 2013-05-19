Feature: HTTP API
  
  To receive notifications from online services
  We're going to need a web interface
  
  Scenario: Post from a web service
    Given I have logged in
    When a post is created via an HTTP POST
    Then I should see the post
