require 'data_mapper'
require 'bcrypt'

class User
  include DataMapper::Resource

  property :id, Serial, key: true
  property :username, String
  property :password, BCryptHash
  # has n, :entries


end
