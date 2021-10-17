require 'sinatra/base'
require 'sinatra/reloader'
require 'sinatra/flash'
require './database_connection_setup'
require 'uri'
require './lib/peep'
require './lib/user'

=begin
require './lib/reply'
require './lib/tags'
require './lib/peep_tag'
=end 

class Chitter < Sinatra::Base 
  configure :development do 
    register Sinatra::Reloader
    register Sinatra::Flash
  end

  enable :sessions
  use Rack::MethodOverride

  get '/' do 
    erb :'/homepage/index'
  end

  get '/home' do 
    @user = User.find(session[:user_id])
    @peeps = Peep.all.reverse
    erb :'/chitter/index'
  end

  get '/users/new' do 
    erb :"users/new"
  end 

  post '/users' do 
    user = User.create(email: params[:email], password: params[:password], 
username: params[:username])
    session[:user_id] = user.id
    redirect '/home'
  end

  post '/home/add' do 
    Peep.add(contents: params[:peep])
    redirect '/home'
  end 

  delete '/home/delete/:id' do 
    Peep.delete(id: params['id'])
    redirect '/home'
  end 

  run! if app_file == $0

end
