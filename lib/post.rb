require 'active_record'
require_relative './database_connection'
establish_database_connection

class Post < ActiveRecord::Base
  belongs_to :user
  @posts = []
  def self.all_peeps
    Post.joins(:user).map do |post|
      @posts << "#{post.time} #{post.user.name} #{post.user.username} #{post.message}"
    end
    @posts
  end

  def self.create_post(time, message, user_id)
    post = Post.new(time: time, message: message, user_id: user_id)
    post.save
    post
  end
  
end
