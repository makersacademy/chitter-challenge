require 'sinatra/activerecord'

class User < ActiveRecord::Base

has_many :messages




end 