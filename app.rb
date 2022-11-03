require 'sinatra'
require 'sinatra/reloader'
require_relative 'lib/database_connection'
require_relative 'lib/user_repository'
require_relative 'lib/post_repository'

DatabaseConnection.connect

class Application < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
    also_reload 'lib/post_repository'
    also_reload 'lib/user_repository'
  end

  get '/feed' do
    repo = PostRepository.new
    posts = repo.all
    @feed = posts.sort_by { |post| [post.date, post.time] }.reverse
    return erb(:feed)
  end


end