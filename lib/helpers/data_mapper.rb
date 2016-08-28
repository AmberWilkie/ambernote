require 'sinatra'
require 'data_mapper'

DataMapper.setup(:default, ENV['DATABASE_URL'] || "postgres://localhost/ambernote_users_test")
DataMapper.finalize
DataMapper.auto_upgrade!
