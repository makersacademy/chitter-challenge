require 'pg'
require 'sinatra'
require './lib/user'

class Chitter < Sinatra::Base
  enable :sessions

  get '/' do
    if session[:user_id].nil?
      erb :index
    else
      erb "Hi, #{session[:user_name]}!"
    end
  end

  get '/post_peep' do
    erb :post_peep
  end

  get '/sign_up' do
    erb :sign_up
  end

  post '/sign_up' do
    user = User.sign_up(name: params[:name], email: params[:email], username: params[:username], password: params[:password])
    session[:user_id] = user.id
    session[:user_name] = user.name
    redirect '/'
  end

  get '/log_in' do
    erb :log_in
  end

  run! if app_file == $0

end
