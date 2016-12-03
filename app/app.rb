ENV['RACK_ENV'] ||= 'development'
require 'sinatra/base'
require_relative 'data_mapper_setup'


class Chitter < Sinatra::Base

  enable :sessions
  set :session_secret, 'my secret password'


get '/' do
  "Hello world!"
end

get '/signup' do
  erb :'/users/signup'
end

post '/signup' do
  p params
  user = User.create(first_name: params[:first_name], surname: params[:surname], email: params[:email],password: params[:password])
  session[:user_id] = user.id
  session[:first_name] = user.first_name
  #require'pry';binding.pry
  redirect'/home'
end

get '/signin' do
  erb :'/users/signin'
end

post '/signin' do
 p params
 redirect'/home'
end


get '/veiw_peeps' do
  erb :'/peeps/view_peeps'
end
 

get '/new_peep' do
  erb :'/peeps/new'
end

post '/peep' do
  p params
  redirect'/veiw_peeps'
end








# start the server if ruby file executed directly
run! if app_file == $0

end
