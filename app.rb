require 'sinatra/base'
require 'sinatra/reloader'
require 'sinatra'
require_relative 'lib/database_connection'
require_relative 'lib/post_repository'
require_relative 'lib/user_repository'

DatabaseConnection.connect('chitter_db_test')


class Application < Sinatra::Base
  # This allows the app code to refresh
  # without having to restart the server.
  configure :development do
    register Sinatra::Reloader
  end

  get '/homepage' do
    post_repo = PostRepository.new
    @posts = post_repo.all.sort_by{|post| post.date_time}.reverse
    return erb(:homepage)
  end

  get '/sign_up' do
    return erb(:sign_up)
  end

  post '/sign_up' do
    user_repo = UserRepository.new
    user_repo.sign_up(params[:name], params[:email], params[:user_name], params[:password])
    return erb(:sign_up_confirmation)
  end

  get '/log_in' do
    return erb(:log_in)
  end

  post '/log_in' do
    user_repo = UserRepository.new
    user_repo.log_in(params[:user_name].to_s, params[:password].to_s)
    @log_in_status = user_repo.check_logged_in(params[:user_name])
    return erb(:log_in_confirmation)
  end
end