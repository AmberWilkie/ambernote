require './lib/models/entry'
require './lib/helpers/data_mapper'
require 'pry'
require 'database_cleaner'

describe Entry do

  before do
    @entry = Entry.new
    @entry.finished = "Blackjack"
    @entry.progress = "Ambernote"
    @entry.save
  end

  it 'is expected to have information in "finished"' do
    expect(Entry.first(finished: "Blackjack").progress).to eq "Ambernote"
  end

  it 'is expected to have a user associated with it' do

  end

  it 'is expected to have a date associated with it' do

  end


end
