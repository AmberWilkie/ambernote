require 'data_mapper'


class User
  include DataMapper::Resource

  property :id, Serial, key: true
  property :username, String, length: 128
  property :password, BCryptHash, required: true

end
