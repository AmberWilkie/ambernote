Feature: Logging In

Scenario: A previously-registered user logs in
Given I am on the "home" page
Then I should see "Hello there!"
When I fill in "username" with "amber"
And I fill in "password" with "amber"
When I click the "Log In" button
Then I should be on the "myhome" page
And I should see "Write something"
