require 'sinatra/base'
require 'sinatra/flash'
require './lib/peep.rb'
require './database_connection_setup'
require './lib/user.rb'

class Chitter < Sinatra::Base

  enable :sessions
  register Sinatra::Flash

  get '/' do
    @peeps = Peep.all.reverse
    @user = User.find(session[:user_id])
    erb(:index)
  end

  post '/save_peep' do
    Peep.add(params[:Comment_box], params[:Username_box], (Time.now).strftime('%r'))
    redirect to('/')
  end

  get '/sign_up_page' do
    erb(:signup)
  end

  post '/save_user' do
    user = User.create(params[:username], params[:email], params[:password])
    session[:user_id] = user.id
    redirect to('/')
  end

  get '/sign_in_page' do
    erb(:signin)
  end

  get '/sign_out_page' do
    session[:user_id] = nil
    flash[:notice] = 'You have succesfully signed out'
    redirect to('/')
  end

  post '/sign_in' do
    user = User.authenticate(params[:email], params[:password])
    if user
      session[:user_id] = user.id
      redirect to('/')
    else
      flash[:warning] = 'Please check your email or password'
      redirect to('/sign_in_page')
    end
  end

  run! if app_file == $0

end
