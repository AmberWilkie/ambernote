Feature: Keep out those who are not registered users

Scenario: A non-registered user tries to log in
Given I am on the "home" page
Then I should see "Hello there!"
When I fill in "username" with "nothing"
And I fill in "password" with "nothing"
When I click the "Log In" button
Then I should see "Hello there!"
