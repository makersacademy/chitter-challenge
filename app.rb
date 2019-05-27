require 'sinatra/base'
require_relative './lib/user'

class Chitter < Sinatra::Base
  enable :sessions

  get '/chitter' do
    erb :chitter
  end

  post '/chitter' do
    # session[:email] = params[:email]
    # session[:password] = params[:password]
    session[:name] = params[:name]
    # session[:username] = params[:username]
    user = User.new(params[:email], params[:password], params[:name], params[:username])
    user.add
    redirect :signedin
  end

  get '/signedin' do
    @name = session[:name]
    erb :signedin
  end

  post '/signedin' do
    session[:peep] = params[:peep]
    redirect :signedin
  end

  get '/signedin' do
    erb signedin
  end

end
