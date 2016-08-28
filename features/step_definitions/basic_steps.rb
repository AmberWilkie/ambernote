Given(/^I am on the "([^"]*)" page$/) do |page|
  if page == "home"
    visit '/'
    goto = '/'
  elsif page == "myhome"
    visit '/myhome'
    goto = '/myhome'
  elsif page == "New Entry"
    visit '/new_entry'
    goto = '/new_entry'
  end
  expect(current_path).to eq goto
end

Then(/^I should see "([^"]*)"$/) do |text|
  expect(page).to have_content text
end

When(/^I fill in "([^"]*)" with "([^"]*)"$/) do |element, text|
  fill_in element, with: text
end

When(/^I click the "([^"]*)" button$/) do |button|
  click_button(button)
end

Then(/^I should be on the "([^"]*)" page$/) do |page|
  expect(page).to be page
end

When(/^I click the "([^"]*)" link$/) do |link|
  click_link_or_button link
end
