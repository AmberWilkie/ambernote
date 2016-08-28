Feature: As a programmer
  in order to walk away from my computer safely
  I should be able to log out of a session.

Scenario: I log out of my session.
Given I am on the "home" page
And I am logged in
Then I should see "Log Out"
When I click the "Log Out" link
Then I should see "Successfully logged out."
