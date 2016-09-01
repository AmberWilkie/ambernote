require 'data_mapper'
require 'pry'

class Entry
  include DataMapper::Resource
  DataMapper::Property::String.length(5000)
  DataMapper::Property::Text.length(5000)

  property :id, Serial, key: true
  property :finished, Text
  property :progress, Text
  property :languages, Text
  property :skillsets, Text
  property :woohoo, Text
  property :fuckups, Text
  property :notes, Text
  property :created_at, DateTime

  belongs_to :user

end
