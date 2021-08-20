require "sinatra"
require "sinatra/base"
require "sinatra/reloader" if development?
require_relative './lib/peep'

class Chitter < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end

  enable :sessions

  get '/' do
    @peeps = Peep.all
    erb :index
  end
  
  post '/add_peep' do
    Peep.add(params[:peep], params[:user])
    redirect '/'
  end 

  run! if app_file == $0
end
