require './lib/models/user'
require './lib/helpers/data_mapper'
require 'pry'
require 'database_cleaner'


describe User do

  before do
    @user = User.new
    @user.username = "user"
    @user.password = "123"
    @user.save
  end

  it {is_expected.to validate_presence_of(:username)}
  it {is_expected.to validate_uniqueness_of(:username)}
  it {is_expected.to validate_presence_of(:password)}


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
