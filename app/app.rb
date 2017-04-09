ENV["RACK_ENV"] ||= "development"
require 'sinatra'
require_relative 'data_mapper_setup'

class Chitter < Sinatra::Base
enable :sessions

  get '/peeps' do
    erb :'peeps/index'
  end

  get '/user/new' do
    @user = User.new
    erb :'user/new'
  end

  post '/user' do
    @user = User.create(email: params[:email], password: params[:password], password_confirmation: params[:password_confirmation])
    session[:id] = @user.id
    redirect('/peeps')
  end

  def current_user
    User.first(:id => session[:id])
  end

end
