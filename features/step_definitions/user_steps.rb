require 'pry'

When(/^I visit the "([^"]*)" page$/) do |page|
  if page == "home"
    visit '/'
  else
    visit '/'
  end
end

Then(/^I should see "([^"]*)"$/) do |text|
  expect(page).to have_content text
end

When(/^I fill in "([^"]*)" with "([^"]*)"$/) do |field, text|
  fill_in element, with: text
end
