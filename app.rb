require 'sinatra/base'
require 'sinatra/reloader'
require './lib/peep'
require './lib/user'

class ChitterPage < Sinatra::Base
   enable :sessions

  configure :development do
    register Sinatra::Reloader 
  end

  get '/' do
    erb :index
  end

 post '/add-user' do
    User.add(params[:username], params[:password])
    redirect :peeps
  end

  get '/peeps' do
    @peeps = Peep.all
    erb :peeps
  end

  post '/add-peep' do
    Peep.add(params[:username], params[:message])
    redirect :peeps
  end

  run! if app_file == $0

end
