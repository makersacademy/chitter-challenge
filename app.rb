require 'sinatra/base'
require './lib/user'
require './lib/peep'

class Chitter < Sinatra::Base
enable :sessions

  get '/' do
    erb :index
  end

  get '/sign_up' do
    erb :sign_up
  end

  post '/sign_up' do
    session[:name] = params[:name]
    # User.add(params[:name], params[:username], params[:email], params[:password])
    redirect '/peeps'
  end

  get '/peeps' do
    @name = session[:name]
    erb :peeps
  end

  get '/new_post' do
    erb :new_post
  end

  post 'new_post' do
    redirect '/peeps'
  end
  

  run! if app_file ==$0
end



