Feature: As a programmer
  in order to access the site
  I need to be able to register.

Scenario: Registering to use AmberNote
Given I am on the "home" page
When I click the "Register" link
Then I should see "Register as a new user"
When I fill in "username" with "newuser"
And I fill in "password" with "newuserpass"
And I fill in "password_check" with "newuserpass"
When I click the "Register" button
Then I should be on the "myhome" page
And I should see "Logged in as newuser"
