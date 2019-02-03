require 'sinatra/base'
require './lib/peeps'
require './lib/users'
require_relative 'database_helpers'

database_setup

class Chitter < Sinatra::Base
enable :sessions

get '/' do
  @DB_peeps=Peeps.all
  erb :index
end

post '/peeps' do
  Peeps.create(message: params[:message])
  redirect ('/')
end

get '/user' do
  redirect ('/new_user')
end

get '/new_user' do
  erb :new_user
end

post '/new_user' do
  p Users.create(name: params[:name], username: params[:username], email: params[:email], password: params[:password])
  redirect ('/')
end

end
