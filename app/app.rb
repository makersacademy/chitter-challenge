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

  redirect'/home'
end

get '/signin' do
  erb :'/users/signin'
end

post '/signin' do
 p params
 redirect'/home'
end


get '/home' do
  @peeps = Peep.all.map {|a| a.content}
  #require'pry';binding.pry
  erb :'/peeps/home'
end




get '/new_peep' do
  erb :'/peeps/new'
end

post '/peep' do
  p params
  peep = Peep.create(:content => params[:peep])
  redirect'/home'
end








# start the server if ruby file executed directly
run! if app_file == $0

end
