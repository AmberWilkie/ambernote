require 'data_mapper'
require 'bcrypt'
require 'pry'

class User
  include DataMapper::Resource

  property :id, Serial, key: true
  property :username, String, required: true
  property :password, String, required: true
  has n, :entrys

  validates_uniqueness_of :username

  def authenticate(attempted_password)
    if self.password == attempted_password
      true
    else
      false
    end
  end


end
