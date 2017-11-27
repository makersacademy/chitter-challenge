ENV["RACK_ENV"] ||= 'development'

require 'sinatra/base'
require 'data_mapper'
require_relative 'app/data_mapper_setup.rb'


class Chitter < Sinatra::Base

enable :sessions
set :session_secret, 'super secret'

helpers do
  def current_user
  @current_user ||= User.get(username: session[:username])
  end
end


get '/' do
  erb(:index)
end

post '/' do
  User.first_or_create(email: params[:email], password: params[:password], first_name: params[:first_name], last_name: params[:last_name], username: params[:username])
  redirect '/success'
end

get '/success' do
  erb(:success)
end

post '/new_posts' do
  session[:username] = params[:username]
  erb(:new_posts)
end

get '/log_in' do
  erb(:log_in)
end

get '/signing_up' do
  erb(:signing_up)
end

post '/chitter' do
  @peeps = Peep.all(:order => [ :time.desc ])
  @username = session[:username]
  user = User.first_or_create(username: session[:username])
  user.peeps << Peep.create(message: params[:new_peep], time: Time.new)
  user.save
  erb(:chitter)
end
end
