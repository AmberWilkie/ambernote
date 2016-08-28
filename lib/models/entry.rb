require 'data_mapper'
require 'pry'

class Entry
  include DataMapper::Resource

  property :id, Serial, key: true
  property :finished, String
  property :progress, String
  property :languages, String
  property :skillsets, String
  property :woohoo, String
  property :fuckups, String
  property :notes, String
  property :created_at, DateTime

  belongs_to :user

end
