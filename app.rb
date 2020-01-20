ENV['RACK_ENV'] = 'test'
require 'sinatra/base'
require './lib/models/user'
require './lib/models/peep'
require 'sinatra/flash'

class Chitter < Sinatra::Base
  enable :sessions
  register Sinatra::Flash

  get '/' do
    @peeps = Peep.all
    erb :index
  end

  get '/login' do
    erb :login
  end

  post '/login' do
    p params
    flash[:notice] = "Please enter a valid user" unless User.login(params[:login], params[:password])
    session[:user] = User.login(params[:login], params[:password])
    redirect '/'
  end

  run! if app_file == $0
end
