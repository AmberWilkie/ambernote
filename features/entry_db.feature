Feature: As a programmer
  in order to review my past work
  I'd like to save my journal entries.

Scenario: I save my journal entry for review later
Given I am logged in
Given I am on the "New Entry" page
Then I should see "Entry for"
And I should see "2016"
And I fill in "finished" with "project"
When I click the "Submit" button
Then I should see "Write something"
And I should see "Entry successfully saved"
