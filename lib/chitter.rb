require 'sinatra/base'
require_relative 'database_setup'

class Chitter < Sinatra::Base
  enable :sessions

  #Sets root to parent folder, (looks in root for views by default)
  set :root, File.dirname('../')

  get '/' do
    redirect('/welcome/') if !session[:user_id]
    erb :logged_in_homepage
  end

  post '/peep/new/process/' do
    user = User.first(id: session[:user_id])
    new_peep = Peep.create(text: params[:peep_text], user: user)
    user.peeps << new_peep
    user.save
    redirect('/')
  end

  get '/welcome/' do
    erb :sign_in_or_up
  end

  get '/signup/' do
    erb :sign_up
  end

  post '/signup/process/' do
    if params[:password] == params[:password_confirmation]
      if User.first(email: params[:email])
        raise 'Email already taken'
      else
        user = User.create(email: params[:email], password: params[:password])
        session[:user_id] = user.id
        redirect('/')
      end
    else
      session[:passwords_match] = false
      session[:email_provided_upon_sign_up] = params[:email]
      redirect('/signup/')
    end
  end

  post '/login/process/' do
    user = User.first(email: params[:email])
    if user
      if user.password == params[:password]
        session[:log_in_details] == 'correct'
        session[:user_id] = user.id
        redirect('/')
      end
    end
    session[:log_in_details] = 'incorrect'
    redirect('/welcome/')
  end

  get '/logout/process/' do
    session[:user_id] = nil
    redirect('/')
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
