require 'sinatra/base'
require './lib/user'

class ChitterApp < Sinatra::Base
  enable :sessions

  get '/register' do
    erb :signup
  end

  post '/register' do
    @user = User.new(params[:username], params[:email], params[:password])
    @user.save
    redirect '/log_in'
  end

  get '/log_in' do
    erb :log_in
  end

  post '/log_in' do
    redirect '/posts'
  end

  get '/posts' do
    erb :show_posts
  end
end
