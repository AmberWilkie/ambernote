Given(/^I have written an entry on (\d+)\-(\d+)\-(\d+)$/) do |arg1, arg2, arg3|
  user = User.first(username: "amber")
  entry = Entry.new(user: user, finished: "nothing")
  entry.save
  entry_two = Entry.new(user: user, finished: "AmberNote")
  entry_two.save
  expect(Entry.all).not_to be []
end
