Feature: Logging In

Scenario: A previously-registered user logs in
Given I am on the "home" page
Then I should see "Hello there!"
When I fill in "username" with "admin"
And I fill in "password" with "admin"
Then I should be on the "myhome" page
