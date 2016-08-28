Given(/^I am logged in$/) do
  # This feels so wrong. I am breaking all rules of silo-ing.
  # Found a thing that would allow me to "stub" a log-in but it didn't work.
  # https://github.com/plataformatec/devise/wiki/How-To:-Test-with-Capybara
  visit '/'
  fill_in "username", with: "amber"
  fill_in "password", with: "amber"
  click_button("Log In")
  expect(current_path).to eq '/myhome'
end

Given(/^I am not logged in$/) do
  # I don't think I should have to do anything here. By default a new setup would not be logged in.
end

When(/^I try to visit the "([^"]*)" page$/) do |arg1|
  visit '/myhome'
end
