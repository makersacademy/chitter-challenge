require 'sinatra/base'
require 'sinatra/flash'
require_relative 'data_mapper_setup'
require_relative './models/peep'

class Chitter < Sinatra::Base
  enable :sessions
  set :sessions_secret, 'secret'
  register Sinatra::Flash

  get '/feed' do
    user_email = User.get(session[:user_id]).email if session[:user_id]
    @welcome_message = user_email ? "Howdy #{User.get(session[:user_id]).email}" : "Peeps"
    @peeps = Peep.all.sort { |a, b| b.time_created <=> a.time_created }
    erb :feed
  end

  post '/feed' do
    puts "Time now: #{Time.now}"
    Peep.create(message: params[:message], time_created: Time.now)
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
end
