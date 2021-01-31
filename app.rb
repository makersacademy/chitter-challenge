require 'sinatra'
require "./lib/peep"
require "./lib/user"



class Chitter < Sinatra::Base

  enable :sessions

  attr_reader :username, :new_username, :password

  get '/' do
      erb(:sign_in)
  end


  post '/log_in' do
    session[:username] = params[:username]
    session[:password] = params[:password]
    if User.find_user(username: session[:username]) == false
      redirect('/no_user')
    else
      redirect('/check_password')
    end
  end

  get '/no_user' do
    erb(:no_user_sign_up)
  end

  get '/check_password' do
    if User.check_password(username: session[:username], password: session[:password]) == true
      redirect('/chitter')
    else
      redirect('/password_error')
    end
  end

  get '/password_error' do
    erb(:invalid_password)
  end

  post '/sign_up' do
    session[:username] = params[:new_username]
    User.create_user(username: session[:username], password: params[:new_password], email: params[:email])
    redirect '/chitter'
  end

  get '/chitter' do
    @username = session[:username]
    p "username is #{@username}"
    @peeps = Peep.all
    erb(:index)
  end

  get '/peep' do
    erb(:peep)
  end

  post '/new_peep' do
    Peep.create(message: params[:peep], sender: session[:username])
    redirect('/chitter')
  end

end
