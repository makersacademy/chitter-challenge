require 'sinatra/activerecord'

class Peep < ActiveRecord::Base
  validates_presence_of :content
  belongs_to :users
end