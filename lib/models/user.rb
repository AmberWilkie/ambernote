require 'data_mapper'
require 'bcrypt'
require 'pry'

class User
  include DataMapper::Resource

  property :id, Serial, key: true
  property :username, String, required: true
  property :password, BCryptHash, required: true, length: 255
  has n, :entrys

  validates_presence_of :username
  validates_uniqueness_of :username
  validates_presence_of :password

  def authenticate(attempted_password)
    if self.password == attempted_password
      true
    else
      false
    end
  end


end
