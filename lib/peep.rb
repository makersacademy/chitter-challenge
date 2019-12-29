require 'sinatra/activerecord'

class Peep < ActiveRecord::Base
  belongs_to :user
end
