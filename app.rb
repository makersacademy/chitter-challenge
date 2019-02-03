require 'sinatra/base'
require './lib/peep'
require './lib/user'

class Chitter < Sinatra::Base

get '/' do
  erb :login
end

post '/' do
  redirect '/' if !User.sign_in_check(params[:user_email], params[:user_password])
  @user = User.sign_in(params[:user_email], params[:user_password])
  redirect '/feed'
end

get '/feed' do
  @peeps = Peep.all
  @users = User.all_users
  erb :index
end

post '/feed' do
  Peep.add(params[:add_peep], User.id)
  redirect '/feed'
end

get '/register' do
  erb :user_form
end

post '/register' do
  User.add(params[:add_username], params[:add_email], params[:add_password])
  redirect '/'
end

end
