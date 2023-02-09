require 'sinatra/base'
require 'sinatra/reloader'
require_relative 'lib/database_connection'
require_relative 'lib/post_repository'
require_relative 'lib/user_repository'
require 'date'

DatabaseConnection.connect

class Application < Sinatra::Base
  # This allows the app code to refresh
  # without having to restart the server.
  configure :development do
    register Sinatra::Reloader
    also_reload 'lib/user_repository'
    also_reload 'lib/post_repository'
  end

  get '/' do
    @posts_list = []
    post_repo = PostRepository.new
    posts = post_repo.all
    user_repo = UserRepository.new
    users = user_repo.all

    posts.each do |post|
      content = post.content
      user = users.select {|user| user.id == post.user_id}

      # p user[0].username
      # formatted_post = "#{post.content} by #{user[0].username} at #{post.date} #{post.time}
      #


      time_diff = post_repo.time_difference(post.date,post.time,Time.now)

      # p time_diff
      post_info = {
        content:post.content,
        date:post.date,
        time:post.time,
        time_diff:time_diff,
        user_id:post.user_id, 
        username:user[0].username,
        name:user[0].name,
        email:user[0].email,
      }

      # @posts_list << formatted_post
      @posts_list.unshift(post_info)
    end
    return erb(:index)
    # return 'Hello'
  end


end


