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
Then I should see "Agile"
And I should see "Entry successfully saved"

Scenario: I write an actual line that might be in a journal entry, longer than 50 characters
Given I am logged in
Given I am on the "New Entry" page
Then I should see "Entry for"
And I should see "2016"
And I fill in "finished" with "Here's a line that has a bunch of characters - like way more than I have been testing for. Dammit. But what if it has even more, like a bunch. Like a whole bunch and they go on and on and on and on? What if it had a in it?"
When I click the "Submit" button
Then I should see "Agile"
And I should see "Entry successfully saved"
When I click the "2016-9-1" link
Then I should see "What if it had a"

Scenario: I have line breaks in my journal entry
Given I am logged in
Given I am on the "New Entry" page
Then I should see "Entry for"
And I should see "2016"
And I fill in "finished" with
"""
      If you'd like us to take care of these
      scumbags before they cause you any trouble, press 1. Putting some more text.
      Also more text here, just for the heck of it.
      """
When I click the "Submit" button
Then I should see "Agile"
And I should see "Entry successfully saved"
When I click the "2016-9-1" link
Then I should see "of these scumbags"
