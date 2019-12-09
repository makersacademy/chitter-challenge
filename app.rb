require 'sinatra'
require './lib/peep_class'
require './lib/user_class'

class Chitter < Sinatra::Base

  get '/' do
    erb(:login)
  end

  post '/User/new' do
    current_user = User.create(email: params[:email], password: params[:password])
    session[:email] = current_user.email[0]
    redirect '/homepage'
  end

  get '/homepage' do
    @all_post = Peep.sort_by
    @user_email = session[:user_email]
    erb(:homepage)
  end

  post '/homepage/add' do
    Peep.post(message: params[:what])
    redirect '/homepage'
  end

  run! if app_file == $0
end
