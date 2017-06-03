ENV['RACK_ENV'] ||= "development"

require 'sinatra/base'
require_relative 'data_mapper_setup'

class Chitter < Sinatra::Base
  enable :session


get('/') do
  if User.count == 0
    @email = "New user"
  else
    @email = User.last.email
  end

  @chits = Peep.all(:order => [ :time.desc ])
  erb :index
end

get('/add') do
  erb :add
end

post ('/') do
  erb :add
  peep = Peep.create(content: params[:content], time: Time.new )
  redirect '/'
end

get '/signup' do
  erb :signup
end

post '/newuser' do
  user = User.create(email: params[:email], password: params[:password])
  p user
  p user.id
  session[:user_id] = user.id
  p session[:user_id]
  redirect '/'
end

end
