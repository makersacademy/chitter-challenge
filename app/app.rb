require 'sinatra/base'
require 'sinatra/flash'
require_relative 'data_mapper_setup'
require_relative './models/peep'

class Chitter < Sinatra::Base
  enable :sessions
  set :sessions_secret, 'secret'
  register Sinatra::Flash

  helpers do
    def current_user
      @current_user ||= User.get(session[:user_id])
    end
  end

  get '/feed' do
    user_email = User.get(session[:user_id]).email if session[:user_id]
    @welcome_message = user_email ? "Howdy #{User.get(session[:user_id]).email}" : "Latest peeps"
    @peeps = Peep.all.sort { |a, b| b.time_created <=> a.time_created }
    erb :feed
  end

  post '/feed' do
    peep = Peep.create(message: params[:message], time_created: Time.now)
    peep.user = current_user
    peep.save
    redirect '/feed'
  end

  get '/user/new' do
    erb :'/user/new'
  end

  post '/makeuser' do
    user = User.new(email: params[:email],
                    password: params[:password],
                    password_confirmation: params[:password_confirmation])
    if user.save
      session[:user_id] = user.id
      redirect '/feed'
    else
      flash.now[:notice] = "Password and confirmation password do not match"
      erb :'/user/new'
    end
  end

  run! if app_file == $0
end
