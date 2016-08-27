Feature: User log-in.

Scenario: A previously registered user tries to log into the site.
Given: "admin" has already been registered
When I visit the "home" page
Then I should see "Welcome!"
When I fill in "Username" with "admin"
And I fill in "Password" with "admin"
Then I should see "Successfully"
