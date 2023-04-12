require 'sinatra/base'
require 'sinatra/reloader'

class Application < Sinatra::Base
  # This allows the app code to refresh
  # without having to restart the server.
  configure :development do
    register Sinatra::Reloader
  end

  get '/' do
    return erb(:index)
  end

  get '/peeps/new' do
    return erb(:new_peep)
  end

  post '/peeps' do
    @title = params[:title]
    @content = params[:content]
    return erb(:peep_created)
  end

  get '/signup/new' do
    return erb(:new_signup)
  end
end

  