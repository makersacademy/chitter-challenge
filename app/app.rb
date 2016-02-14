ENV['RACK_ENV'] ||= "development"
require 'sinatra/base'
require 'sinatra/flash'
require_relative 'data_mapper_setup'

class Chitter < Sinatra::Base
  use Rack::MethodOverride

  enable :sessions
    register Sinatra::Flash

    set :session_secret, 'super secret'

    helpers do
     def user_name
      @user_name ||= User.get(session[:user_id])
     end
    end

    get '/users/new' do
      @peeps = Peep.all
      erb :'users/new'
    end

    post '/users' do
      user = User.new(params)
      if user.save
        session[:user_id] = user.id
        redirect '/chat'
      else
        flash[:error] = user.errors.full_messages.join('. ')
        flash[:email] = params[:email]
        flash[:name] = params[:name]
        flash[:username] = params[:username]
        redirect '/users/new'
      end
    end

      get '/chat' do
        @peeps = Peep.all
        erb :'links/chat'
      end

      get '/chat/add' do
        erb :'links/add'
      end

      post '/chat' do
        peep = Peep.create(message: params[:message], peeper: user_name.username, time: Time.new.asctime)
          # params[:].split.each do |tag|
          #   link.tags << Tag.create(tags: tag)
          peep.save
          redirect '/chat'
       end

      get '/session/new' do
        @peeps = Peep.all
        erb :'session/new'
      end

      post '/session' do
        user = User.first(email: params[:email])
        if user.password == params[:password]
          session[:user_id] = user.id
          redirect '/chat'
        else
          flash[:password] = 'Password incorrect'
          flash[:email] = params[:email]
          redirect '/session/new'
        end
      end

        delete '/session' do
          flash[:goodbye] = "Goodbye, #{user_name.username}!"
          session[:user_id] = nil
          redirect '/session/new'
        end

  run! if app_file == $0
  end
