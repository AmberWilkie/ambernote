require './lib/models/entry'
require './lib/helpers/data_mapper'
require 'pry'
require 'database_cleaner'

describe Entry do

  before do
    @user = User.new(username: "user", password: "pass")
    @user.save
    @entry = Entry.new
    @entry.user = @user
    @entry.finished = "Blackjack"
    @entry.progress = "Ambernote"
    @entry.save
  end

  it 'is expected to have information in "finished"' do
    expect(Entry.first(finished: "Blackjack").progress).to eq "Ambernote"
  end

  it 'is expected to have a user associated with it' do
    expect(Entry.first(finished: "Blackjack").user).not_to be nil
  end

  it 'is expected to have a date associated with it' do
    expect((Entry.first(finished: "Blackjack").created_at)).not_to be nil
  end


end
