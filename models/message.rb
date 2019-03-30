require 'sinatra/activerecord'

class Message < ActiveRecord::Base

  def create(content:)
    Message.new(content:content)


  end 










end 