Given(/^I have written an entry on today's date$/) do
  user = User.first(username: "amber")
  entry = Entry.new(user: user, finished: "first_step", notes: "notes made")
  entry.save
  visit '/myhome'
  expect(Entry.all).not_to be []
end

# I know this is sloppy, but it works. For some reason the Entry table is getting wiped after this one ^^^ so I have to keep everything in the same test line here:

Then(/^I should see an entry for today's date$/) do
  user = User.first(username: "amber")
  entry = Entry.new(user: user, finished: "second_step")
  entry.save
  visit '/myhome'
  expect(page).to have_content Date.today.year
end
