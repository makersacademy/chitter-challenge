require 'sinatra/base'
require 'sinatra/reloader'

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
    if invalid_request_parameters?
      status 400
      return ''
    end
    return erb(:signupsuccess)
  end

  private

  def invalid_request_parameters?
    params[:username] == nil || params[:name] == nil || params[:email] == nil || params[:password] == nil
  end
end
