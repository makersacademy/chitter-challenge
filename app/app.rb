require 'sinatra/base'
require 'data_mapper'
require 'dm-postgres-adapter'
require_relative 'data_mapper_setup'

class Chitter < Sinatra::Base
	helpers do
		def current_user
			@current_user ||= User.get(session[:user_id])
		end
	end
	enable :sessions

	set :session_secret, 'super secret'

  get '/' do
    redirect '/home'
  end

  get '/home' do
  	erb :home
  end

  post '/new' do
    user = User.create(:email => params[:email], :password => params[:password], :name => params[:name], :user_name => params[:user_name])
    session[:user_id] = user.id
    redirect '/welcome'
  end

  get '/welcome' do
  	erb :welcome
end

end