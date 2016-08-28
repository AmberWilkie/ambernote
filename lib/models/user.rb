require 'data_mapper'
require 'bcrypt'
require 'pry'

class User
  include DataMapper::Resource

  property :id, Serial, key: true
  property :username, String
  property :password, String
  has n, :entrys
  # binding.pry

  def authenticate(attempted_password)
    if self.password == attempted_password
      true
    else
      false
    end
  end


end
