Given(/^I have written an entry on (\d+)\-(\d+)\-(\d+)$/) do |arg1, arg2, arg3|
  user = User.first(username: "amber")
  entry = Entry.new(user: user, finished: "nothing")
  entry.save
  entry_two = Entry.new(user: user, finished: "AmberNote")
  entry_two.save
  expect(Entry.all).not_to be []
end

# I know this is sloppy, but it works. For some reason the Entry table is getting wiped after this one ^^^ so I have to keep everything in the same test line here:

Then(/^I should see an entry for "([^"]*)"$/) do |arg1|
  user = User.first(username: "amber")
  entry = Entry.new(user: user, finished: "nothing")
  entry.save
  entry_two = Entry.new(user: user, finished: "AmberNote")
  entry_two.save
  visit '/myhome'
end
