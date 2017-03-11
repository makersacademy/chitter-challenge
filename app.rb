require 'sinatra/base'
require_relative 'models/user'

class Chitter < Sinatra::Base
# attr_reader :first_name, :happy
get '/' do
  erb :first_screen
end

get'/login' do
  erb :login
end

get '/sign_up' do
erb :sign_up
end


post '/confirmation_screen' do
user = User.create(first_name: params[:first_name], last_name: params[:last_name], user_name: params[:user_name], email: params[:email], password: params[:password])
  @first_name = params[:first_name]
  erb :confirmation_screen
end

end
