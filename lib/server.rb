require 'sinatra/base'
require 'rack-flash'
require './lib/database_setup'
# require './lib/SessionHelpers'

# require_relative 'application_helpers'

class Chitter < Sinatra::Base
#   include ApplicationHelpers

  enable :sessions
#   use Rack::Flash
#   use Rack::MethodOverride
#   set :session_secret, 'super secret'

#   post '/set-flash' do
#     flash[:notice] = 'Thanks for signing up!'
#     flash[:notice]
#     flash.now[:notice] = 'Thanks for signing up!'
#   end

  get '/' do
    @peeps = Peep.all
    erb :index
  end

  post '/peeps' do
    message = params['content']
    Peep.create(content: message)
    redirect to('/')
  end

  get '/users/new' do
    @user = User.new
    erb :'users/new'
  end

post '/users' do
  user = User.create(email: params[:email],
                     username: params[:username],
                     password: params[:password],
                     password_confirmation: params[:password_confirmation])
  session[:user_id] = user.id
  redirect to('/')
end

#   post '/users' do
#     @user = User.create(email: params[:email],
#                         password: params[:password],
#                         password_confirmation: params[:password_confirmation])
#     if @user.save
#       session[:user_id] = @user.id
#       redirect to('/')
#     else
#       flash.now[:errors] = @user.errors.full_messages
#       erb :'users/new'
#     end
#   end

# ??? I still don't fully understand what Helpers really are, or work.
helpers do

  def current_user
    @current_user ||= User.get(session[:user_id]) if session[:user_id]
  end

end

#   get '/sessions/new' do
#     erb :'sessions/new'
#   end

#   post '/sessions' do
#     email, password = params[:email], params[:password]
#     user = User.authenticate(email, password)
#     if user
#       session[:user_id] = user.id
#       redirect to('/')
#     else
#       flash[:errors] = ['The email or password is incorrect']
#       erb :'sessions/new'
#     end
#   end

#   delete '/sessions' do
#     session.clear
#     flash[:notice] = 'Good bye!'
#     redirect '/'
#   end

#   # get '/tags/:text' do
#   #   tag = Tag.first(text: params[:text])
#   #   @peep = tag ? tag.peeps : []
#   #   erb :index
#   # end

#   get '/sessions/recover_password' do
#     erb :"sessions/recover_password"
#   end

#   post '/sessions/recover_password' do
#     User.recover_password(params[:email])
#   end

#   get 'users/recover_password/:token' do
#     User.first(password_token: token)
#   end
end
