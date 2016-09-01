Feature: As a programmer
  In order to view my previous entries
  I would like to see a list of previous entries in "myhome"
  and I would like to be able to click on them to view details of individual entries

Scenario: I view the list of entries on in "myhome"
  Given I am logged in
  And I am on the "myhome" page
  And I have written an entry on today's date
  Then I should see an entry for today's date

Scenario: I want to view the details of an entry
  Given I am logged in
  And I am on the "myhome" page
  And I have written an entry on today's date
  When I click the "2016-8-31" link
  Then I should see "Projects Completed"
  And I should see "first_step"
  And I should see "notes made"
