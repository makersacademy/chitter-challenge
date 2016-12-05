ENV["RACK_ENV"] ||= "development"

require 'sinatra/base'
require_relative 'data_mapper_setup'
require_relative 'helpers.rb'

class Chitter < Sinatra::Base
  enable :sessions

  include Helpers

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
    user = User.first(username: params[:username])
    if user
      if user.authenticated?(params[:password])
        session[:user] = User.first(:username => params[:username])
        session[:new_user] = false
        redirect to('/users/homepage')
      end
    else
      redirect to('/users')
    end
    redirect to('/users')
  end

  get '/users/homepage' do
    @new_user = session[:new_user]
    @user = session[:user]
    erb :homepage
  end

  post '/peeps/new' do
    @user_peep = Peep.new(time: current_time,
                          body: params[:peep_field],
                          user_id: session[:user].id)
    @user_peep.save
    redirect to('/peeps')
  end

  get ('/peeps') do
    @all_peeps = (Peep.all.map { |record| [record.body, record.time, record.user.name] }).reverse
    @all_peeps = @all_peeps.map { |peep| peep.join("<br>") }
    @all_peeps = @all_peeps.join("<br><br>")
    @user_logged_in = session[:user]
    erb :peep_board
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
