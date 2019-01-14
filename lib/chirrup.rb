require 'sinatra'
require 'sinatra/activerecord'

class Chirrup < ActiveRecord::Base

  belongs_to :user

  validates :content, presence: true

end
