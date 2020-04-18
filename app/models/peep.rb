require 'sinatra'
require 'sinatra/activerecord'

class Peep < ActiveRecord::Base
  belongs_to :users

  def username
    User.find(user_id).username
  end

  def author
    User.find(user_id).name
  end
end
