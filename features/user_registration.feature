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
And I should see "Account created. Logged in as newuser"

Scenario: Registering to use AmberNote with mismatched passwords
Given I am on the "home" page
When I click the "Register" link
Then I should see "Register as a new user"
When I fill in "username" with "newuser"
And I fill in "password" with "newuserpass"
And I fill in "password_check" with "newuserwrongpass"
When I click the "Register" button
Then I should see "Passwords do not match."

Scenario: Registering to use AmberNote with no password
Given I am on the "home" page
When I click the "Register" link
Then I should see "Register as a new user"
When I fill in "username" with "newuser"
When I click the "Register" button
Then I should see "Passwords must be greater than four characters"

Scenario: Registering to use AmberNote with no username
Given I am on the "home" page
When I click the "Register" link
Then I should see "Register as a new user"
And I fill in "password" with "amber"
And I fill in "password_check" with "amber"
When I click the "Register" button
Then I should see "Username must not be blank"

Scenario: Registering to use AmberNote with an already-registered username
Given I am on the "home" page
When I click the "Register" link
Then I should see "Register as a new user"
When I fill in "username" with "amber"
And I fill in "password" with "amber"
And I fill in "password_check" with "amber"
When I click the "Register" button
Then I should see "Username is already taken"
