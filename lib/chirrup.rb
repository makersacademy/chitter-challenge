require 'sinatra'
require 'sinatra/activerecord'

class Chirrup < ActiveRecord::Base
  validates :content, presence: true
end
