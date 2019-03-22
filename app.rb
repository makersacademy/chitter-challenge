ENV['RACK_ENV'] = 'development'

require 'sinatra/base'
require './config/data_mapper.rb'
require 'pry'

class Chitter < Sinatra::Base

  enable :sessions
  enable :method_override

  get '/' do
    @peeps = Peep.all
    erb :index
  end

  get '/sign-up' do
    erb :sign_up
  end

  post '/sign-up' do
    user = User.create(name: params[:name], username: params[:username], email: params[:email], password: params[:password])
    if user
      session[:user_id] = user.id
      redirect '/profile'
    else
      redirect '/'
    end
  end

  get '/sign-in' do
    erb :sign_in
  end

  post '/sign-in' do
    user = User.authenticate(params[:email], params[:password])
    if user
      session[:user_id] = user.id
      redirect '/profile'
    else
      redirect '/'
    end
  end

  delete '/sign-out' do
    session.delete(:user_id)
    redirect '/'
  end

  get '/profile' do
    @peeps = Peep.all
    erb :profile
  end

  post '/profile' do
    current_user.peeps.create(content: params[:content], created_at: Time.now)
    redirect '/profile'
  end

  private

  def current_user
    User.get(session[:user_id])
  end

end
