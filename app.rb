require "sinatra"
require "sinatra/base"
require "sinatra/reloader" if development?

class Chitter < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end

  enable :sessions

  get '/' do
    @peep = session[:peep]
    erb :index
  end
  
  post '/add_peep' do
    session[:peep] = params[:peep]
    redirect '/'
  end 

  run! if app_file == $0
end
