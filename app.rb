require './lib/peep'
require './lib/user'
require 'sinatra'

class Chitter_app < Sinatra::Base
  enable :sessions

  get '/homepage' do
    @message = session[:message]
    @logged_in_as = session[:current_user]

    @peeps = Peep.all
    p "homepage visibility"
     p @logged_in_as
    p @peeps
    erb :homepage
  end

  post '/register' do
    session[:message] = User.add_new(params[:register_username], params[:register_password])
    redirect '/homepage'
  end

  post '/login' do
    session[:current_user] = User.login(params[:login_username], params[:login_password]) 
    redirect '/homepage'
  end

  post '/peep' do
    if session[:current_user] == nil
       session[:message] = "You must log in to peep!"
       redirect '/homepage'
    else
      Peep.add_new(params[:peep], session[:current_user])
      session[:message] = 'Peep Successfuly Peeped'
      redirect '/homepage'
    end
  end

  post '/logout' do
    session[:current_user] = User.logout

    redirect '/homepage'
  end


  run! if app_file == $0
end
