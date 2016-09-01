before do
  create_amber_user
end

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
  elsif page == "search"
    visit '/search'
    goto = '/search'
  else
    false
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

When(/^I click the "([^"]*)" link in the "([^"]*)" section of the page$/) do |button, div_id|
  # find(div_id).find(button).click
  # within(:css, div_id) { click_button(button) }
  page.find(:css, div_id).find(button).click
end

Then(/^I should be on the "([^"]*)" page$/) do |page|
  if page == "home"
    visit '/'
    goto = '/'
  elsif page == "myhome"
    visit '/myhome'
    goto = '/myhome'
  elsif page == "New Entry"
    visit '/new_entry'
    goto = '/new_entry'
  elsif page == "search"
    visit '/search'
    goto = '/search'
  else
    false
  end
  expect(current_path).to eq goto
end

When(/^I click the "([^"]*)" link$/) do |link|
  click_link_or_button link
end
