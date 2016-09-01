Given(/^I have written an entry containing the words "([^"]*)"$/) do |arg1|
  user = User.first(username: "amber")
  entry = Entry.new(user: user, finished: "first_step", notes: "ruby is awesome")
  entry.save
  expect(Entry.all).not_to be []
end
