require 'sinatra'
require 'sinatra/activerecord'

class Peep < ActiveRecord::Base
  belongs_to :users
end
