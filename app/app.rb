ENV["RACK_ENV"] ||= "development"

require 'sinatra/base'
require_relative 'data_mapper_setup'

class Chitter < Sinatra::Base
  enable :sessions

  get '/users/new' do
    erb :sign_up
  end

  post '/users/new' do
    @user = User.new(name: params[:name],
                    username: params[:username],
                    email: params[:email],
                    password: params[:password],
                    password_confirmation: params[:password_confirmation])
    if @user.save
      session[:new_user] = true
      @new_user = session[:new_user]
      session[:user] = User.first(username: params[:username])
      redirect to('/users/homepage')
    else
      redirect to('/users/new')
    end
  end

  get '/users' do
    session[:user] = nil
    erb :sign_in
  end

  post '/users/verification' do
    session[:user] = User.first(:username => params[:username])
    @user = session[:user]
    if @user
      session[:new_user] = false
      redirect to('/users/homepage')
    else
      redirect to('/users')
    end
  end

  get '/users/homepage' do
    @new_user = session[:new_user]
    @user = session[:user]
    erb :homepage
  end

  post '/peeps/new' do
    @user_peep = Peep.create(author: (session[:user]).name,
                            # date: how to do this?
                            body: params[:peep_field])
    @user_peep.save
    all_peeps = Peep.all.map { |record| record.body }
    session[:peeps] = all_peeps
    redirect to('/peeps')
  end

  get ('/peeps') do
    @all_peeps = session[:peeps]
    erb :peep_board
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
