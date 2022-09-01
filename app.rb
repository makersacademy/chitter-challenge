require 'sinatra/base'
require 'sinatra/reloader'
require_relative '/lib/post_repository'
require_relative '/lib/user_repository'

class Application < Sinatra::Base
  # This allows the app code to refresh
  # without having to restart the server.
  configure :development do
    register Sinatra::Reloader
  end

  get "/" do
    return erb(:welcome)
  end

  get "/signup" do
    return erb(:signup)
  end

  post "/signup" do
    if empty_request_parameters? || invalid_request_parameters?
      status 400
      return ''
    end

    user = User.new
    user.username = params[:username]

    return erb(:signupsuccess)
  end

  private

  def empty_request_parameters?
    params[:username] == nil || params[:name] == nil || params[:email] == nil || params[:password] == nil
  end

  def invalid_request_parameters?
    params[:username].length > 20 || params[:name].length > 20 || params[:email].length > 20 || params[:password].length > 20

    params[:password].include?("/[\W][^(\^!@£$%_\-)]/")
  end
end
