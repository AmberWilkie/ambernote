require './lib/models/user'
require './lib/helpers/data_mapper'
require 'pry'
require 'database_cleaner'


describe User do

  before do
    # DatabaseCleaner.strategy = :transaction
    # DatabaseCleaner.start
    @user = User.new
    @user.username = "user"
    @user.password = "123"
    @user.save
  end

  after do
    # DatabaseCleaner.clean
  end

  it 'returns true when the correct password is entered' do
    expect(User.first(username: "user").password).to eq @user.password
  end

  it 'user should have a username' do
    expect(User.first(username: "user").username).to eq "user"
  end

  it 'authenticates a password' do
    expect(@user.authenticate(@user.password)).to eq true
  end
end
