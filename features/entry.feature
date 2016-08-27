Feature: As a programmer
  in order to record my thoughts about programming
  I would like to be able to write journal entries
  that have a standardized format.

Scenario: I want to write a journal entry
Given I am on the "myhome" page
Then I should see "Write something"
When I click the "New Entry" link
Then I should see "New Entry for"
And I should see "Finished Projects"
