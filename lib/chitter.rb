require 'sinatra/base'
require_relative 'database_setup'

class Chitter < Sinatra::Base
  enable :sessions

  #Sets root to parent folder, (looks in root for views by default)
  set :root, File.dirname('../')

  get '/' do
    redirect('/welcome/') if !session[:user_id]
    'Welcome, ' + User.first(id: session[:user_id]).email
  end

  get '/welcome/' do
    erb :sign_in_or_up
  end

  get '/signup/' do
    erb :sign_up
  end

  post '/signup/process/' do
    if params[:password] == params[:password_confirmation]
      user = User.create(email: params[:email], password: params[:password])
      session[:user_id] = user.id
      redirect('/')
    else
      session[:passwords_match] = false
      session[:email_provided_upon_sign_up] = params[:email]
      redirect('/signup/')
    end
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
