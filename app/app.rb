ENV["RACK_ENV"] ||= "development"

require 'sinatra/base'
require_relative 'data_mapper_setup'
require 'sinatra/flash'

class Chitter < Sinatra::Base

   use Rack::MethodOverride

  register Sinatra::Flash

  enable :sessions
  set :session_secret, 'super secret'

  get '/' do
    @messages = Message.all.reverse
    erb :index
  end

  get '/users/new' do
    @user = User.new
    erb :sign_up
  end

  post '/users' do
    @user = User.create(name: params[:name],
                       username: params[:username],
                       email: params[:email],
                       password: params[:password],
                       password_confirmation: params[:password_confirmation])
     if @user.save
     session[:user_id] = @user.id
     redirect '/'
     else
       flash.now[:notice] = "Password and confirmation password do not match"
       erb :sign_up
     end
  end

  post '/post_message' do
     message = Message.create(text: params[:message], time: "#{Time.now.strftime "%R"}")

    redirect '/'
  end

  get '/sessions/new' do
    erb :sign_in
  end

  post '/sessions' do
  user = User.authenticate(params[:email], params[:password])
  if user
    session[:user_id] = user.id
    redirect to('/')
  else
    flash.now[:errors] = ['The email or password is incorrect']
    erb :sign_in
  end
end

   delete '/sessions' do
     session[:user_id] = nil
     flash.keep[:notice] = 'goodbye!'
     redirect to '/'
   end



  helpers do
    def current_user
      @current_user ||= User.get(session[:user_id])
    end
  end

  run! if app_file == $0

end
