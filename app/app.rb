ENV['RACK_ENV'] ||= 'development'
require 'sinatra/base'
require './app/models/data_mapper_setup'
require './app/models/peep'

class Chitter < Sinatra::Base

  enable :sessions
  set :session_secret, 'super secret'

  get '/posts' do
    @peeps = Peep.all(:order => [:created_at.desc])
    @user_name = current_user.user_name
    erb :index
  end

  post '/posts' do
    post = Peep.first_or_create(post_text: params[:post_text], created_at: params[:created_at])
    redirect '/posts'
  end

  get '/new' do
    erb :new
  end

  get '/sign_up' do
  erb :sign_up
end

post '/sign_up' do
  user = User.create(user_name: params[:user_name], email: params[:email], password: params[:password])
  session[:user_id] = user.id
  redirect '/posts'
end

helpers do
 def current_user
   @current_user ||= User.get(session[:user_id])
 end
end

run! if app_file == $0

end
