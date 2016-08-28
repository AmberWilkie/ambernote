Given(/^I am logged in$/) do
  # This feels so wrong. I am breaking all rules of silo-ing.
  # Found a thing that would allow me to "stub" a log-in but it didn't work.
  visit '/'
  fill_in "username", with: "amber"
  fill_in "password", with: "amber"
  click_button("Log In")
  expect(current_path).to eq '/myhome'
end
