require 'data_mapper'
require_relative './datamapper_settings'
class User

  include DataMapper::Resource

  property :id, Serial
  property :name, String, required: true
  property :email, String, unique: true, required: true
  property :password, String, unique: true, required: true
  property :nickname, String, unique: true, required: true

  data_mapper_settings


end
