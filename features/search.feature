Feature: A user can search their journal entries

Scenario: I try to search my journal entries
Given I am logged in
And I am on the "myhome" page
And I have written an entry containing the words "ruby is awesome"
When I fill in "search" with "ruby"
And I click the "Search" button
And I should see "Searching your entries!"
And I should see "ruby is awesome"
