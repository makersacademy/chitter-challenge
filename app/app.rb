ENV["RACK_ENV"] ||= "development"
require 'sinatra/base'
require_relative './models/peep.rb'
require_relative './models/user.rb'

class Chitter < Sinatra::Base

  enable :sessions

  helpers do
    def current_user
      @current_user ||= User.get(session[:user_id])
    end
  end

  get '/peep/all' do
    @peeps = Peep.all
    erb(:'peep/all')
  end

  post '/peep/all' do
    Peep.create(message: params[:message])
    redirect '/peep/all'
  end

  get '/peep/new' do
    erb(:'peep/new')
  end

  get '/user/new' do
    erb(:'user/new')
  end

  post '/user/new' do
    user = User.create(email: params[:email], username: params[:username], password: params[:password])
    session[:user_id] = user.id
    redirect '/peep/all'
  end

end
