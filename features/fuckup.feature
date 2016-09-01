Feature: Be able to see all of your fuck-ups in one spot

Scenario: I want to view all of my fuckups
Given I am logged in
And I am on the "myhome" page
And I have written an entry on today's date
Then I should see "Fuck Ups"
When I click the "Fuck Ups" link
Then I should see "one big fuck up"
