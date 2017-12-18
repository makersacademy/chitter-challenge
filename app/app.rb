ENV["RACK_ENV"] ||= "development"

require 'sinatra'
require 'sinatra/base'
require 'sinatra/flash'
require 'capybara'
require './app/models/peep'
require './app/models/user'
require_relative 'data_mapper_setup'

class ChitterManager < Sinatra::Base

  configure :development do
    DataMapper.auto_upgrade!
  end

  enable :sessions
  set :session_secret, 'super secret'
  register Sinatra::Flash

  helpers do
    def current_user
      @current_user ||= User.get(session[:user_id])
    end
  end

  get('/') do
    erb(:index)
  end

  get('/peeps/new') do
    erb(:new_peep)
  end

  post('/peeps/new') do
    peep = Peep.new(content: params[:peep], name: params[:name], username: params[:username])
    # p peep
    peep.save
    redirect to('/chitter')
  end

  get('/chitter') do
    erb(:index)
  end

  get('/users/new') do
    @user = User.new
    erb(:new_user)
  end

  post('/users') do
    @user = User.new(name: params[:name], email: params[:email], username: params[:username], password: params[:password], password_confirmation: params[:password_confirmation])
    if @user.save
      session[:user_id] = @user.id
      redirect to ('/chitter')
    end
    flash.now[:notice] = 'passwords dont match'
    erb(:new_user)
  end

  # post('/chitter') do
  #   peeps = Peep.all
  # end
  run! if app_file == $0
end
