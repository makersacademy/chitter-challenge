require_relative 'lib/database_connection'
require 'sinatra/base'
require 'sinatra/reloader'
require_relative 'lib/peep'
require_relative 'lib/user'
DatabaseConnection.connect

class Application < Sinatra::Base

  configure :development do
    register Sinatra::Reloader
  end

  get '/' do
    return erb(:home)
  end

  get "/signup" do

    return erb(:signup)
  end

  post "/signup" do
    if invalid_signup?
      status 400
      return ""
    end

    user = User.new
    user.name = params[:username]
    user.password = params[:password]

  end

  def invalid_signup?
    return (params[:username].nil? || params[:password].nil?)
  end

  def invalid_post?
    return params[:peep_comment].nil?
  end
end
