require 'sinatra/base'
require 'sinatra/reloader'

class Chitter < Sinatra::Base

  enable :sessions

  configure :development do
    register Sinatra::Reloader
  end

  get '/' do
    @peep = session[:peep_message]
    erb :post_peep
  end

  post '/' do
    session[:peep_message] = params[:peep_message]
    redirect '/'
  end

  run! if app_file == $0
end