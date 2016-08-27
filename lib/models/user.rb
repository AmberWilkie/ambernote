require 'data_mapper'
require 'bcrypt'

class User
  include DataMapper::Resource

  property :id, Serial, key: true
  property :username, String
  property :password, BCryptHash
  # has n, :entries

  def authenticate(attempted_password)
    if self.password == attempted_password
      true
    else
      false
    end
  end


end
