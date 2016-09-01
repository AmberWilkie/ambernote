Feature: As a programmer
  in order to record my thoughts about programming
  I would like to be able to write journal entries
  that have a standardized format.

Scenario: I want to write a journal entry
Given I am logged in
Given I am on the "myhome" page
Then I should see "Agile"
When I click the "New Entry" link in the "main" section of the page
Then I should see "New Entry for"
And I should see "Finished Projects"
