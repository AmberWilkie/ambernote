require './lib/models/user'
require './lib/helpers/data_mapper'
require 'pry'

describe User do

  before do
    @user = User.new
    @user.username = "user"
    @user.password = "123"
    @user.save
  end

  it 'returns true when the correct password is entered' do
    expect(User.first(username: "user").password).to eq "123"
  end

  it 'user should have a username' do
    expect(User.first(username: "user").username).to eq "user"
  end

  it 'expects admin to be able to login' do
    expect(User.first(username: "amber").password).to eq "amber"
  end
end
