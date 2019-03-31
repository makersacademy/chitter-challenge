require 'sinatra/activerecord'

class Message < ActiveRecord::Base

  # def create(content:)
  #   message = Message.new(content:content)
  #   message.save
  # end 
  belongs_to :user

end
