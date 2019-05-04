require 'sinatra/activerecord'

class Message < ActiveRecord::Base

  belongs_to :user

end
