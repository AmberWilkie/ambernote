Given(/^I am on the "([^"]*)" page$/) do |page|
  # if page == "home"
    visit '/'
  # end
end

Then(/^I should see "([^"]*)"$/) do |text|
  expect(page).to have_content text
end

When(/^I fill in "([^"]*)" with "([^"]*)"$/) do |element, text|
  fill_in element, with: text
end

Then(/^I should be on the "([^"]*)" page$/) do |page|
  expect(page).to be page
end
