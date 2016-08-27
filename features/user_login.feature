Feature: User log-in.

Scenario: A previously registered user tries to log into the site.
Given: "admin" has already been registered
When I visit the "home" page
Then I should see "Hello there!"
When I fill in "username" with "admin"
And I fill in "password" with "admin"
Then I should see "Successfully"
