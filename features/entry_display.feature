Feature: As a programmer
  In order to view my previous entries
  I would like to see a list of previous entries in "myhome"
  and I would like to be able to click on them to view details of individual entries

Scenario: I view the list of entries on in "myhome"
  Given I am logged in
  And I am on the "myhome" page
  And I have written an entry on 2016-08-28
  Then I should see "2016-08-28"
