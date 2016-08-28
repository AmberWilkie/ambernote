Feature: As a programmer
  in order to walk away from my computer safely
  I should be able to log out of a session.

Scenario: I log out of my session.
Given I am on the "home" page
And I am logged in
Then I should see "Log Out"
When I click the "Log Out" link
Then I should see "Successfully logged out."

Scenario: I try to go to '/myhome' without logging in
Given I am not logged in
When I try to visit the "myhome" page
Then I should see "You are not logged in"
