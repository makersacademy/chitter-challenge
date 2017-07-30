require 'sinatra/base'
require_relative 'modles/peep'
require_relative 'datamapper_setup'
require_relative 'lib/time'

class Chitter < Sinatra::Base
  enable :sessions
  set :session_secret, 'super secret'

get '/messages' do
  @peeps = Peep.all
  erb :'messages/index'
end

post '/messages' do
Peep.create(peep: params[:peep], time: TodaysDate.new.todays_date_toady)
redirect '/messages'
end

get '/users/new' do
  erb :'users/new'
end

post '/users' do
  user = User.create(email: params[:email],
                     password: params[:password],
                     password_confirmation: params[:password_confirmation])
  session[:user_id] = user.id
  redirect to('/messages')
end

helpers do
 def current_user
   @current_user ||= User.get(session[:user_id])
 end
end

run! if app_file == $0
end
