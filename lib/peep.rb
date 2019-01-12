require 'sinatra/activerecord'

class Peep < ActiveRecord::Base

  validates_presence_of :content
  validates_presence_of :created_at

  belongs_to :user

end
