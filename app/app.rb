ENV['RACK_ENV'] ||='development'
require 'capybara/rspec'
require 'sinatra/base'
require 'sinatra/flash'
require 'pry'
require 'bcrypt'
require_relative 'data_mapper_setup'

class Chitter < Sinatra::Base
  enable :sessions
  register Sinatra::Flash

helpers do
  def current_user
    @current_user ||= User.get(session[:user_id])
  end
end

get '/' do
  erb(:homepage)
end

post '/new_user' do
  user = User.create(name: params[:name], user_name: params[:user_name],
  email: params[:email], password: params[:password], password_confirmation: params[:password_confirmation])
  if user.save
    session[:user_id] = user.id
    redirect '/chitter'
  else
    flash.now[:notice] = 'Oh No !!! Your password and password confirmation dont match, try again.'
    erb(:homepage)
  end
end

get '/chitter' do
  erb(:chitter)
end

end
