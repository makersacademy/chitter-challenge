require 'data_mapper'
require 'dm-postgres-adapter'
require 'dm-timestamps'
require_relative '../data_mapper_setup'


class Tweet

  include DataMapper::Resource

  property :id, Serial
  property :message, Text

end
