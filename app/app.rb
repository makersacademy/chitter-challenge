ENV["RACK_ENV"] ||= "development"

require 'sinatra/base'
require_relative 'data_mapper_setup'
require 'sinatra/flash'

class Chitter < Sinatra::Base

  register Sinatra::Flash

  enable :sessions
  set :session_secret, 'super secret'

  get '/' do
    @messages = Message.all.reverse
    @user = User.new
    erb :index
  end

  post '/sign_up' do
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
       erb :index
     end
  end

  post '/post_message' do
     message = Message.create(text: params[:message], time: "#{Time.now.strftime "%R"}")

    redirect '/'
  end



  helpers do
    def current_user
      @current_user ||= User.get(session[:user_id])
    end
  end

  run! if app_file == $0

end
