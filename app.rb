require 'sinatra/base'
require './lib/peep.rb'
require './database_connection_setup'
require './lib/user.rb'

class Chitter < Sinatra::Base

  enable :sessions

  get '/' do
    @peeps = Peep.all.reverse
    @user = User.find(session[:user_id])
    erb(:index)
  end

  post '/save_peep' do
    Peep.add(params[:Comment_box], params[:Username_box], (Time.now).strftime('%r'))
    redirect to('/')
  end

  get '/sign_up' do
    erb(:signup)
  end

  post '/save_user' do
    user = User.create(params[:username], params[:email], params[:password])
    session[:user_id] = user.id
    redirect to('/')
  end

  run! if app_file == $0

end
