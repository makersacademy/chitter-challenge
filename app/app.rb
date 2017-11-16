ENV["RACK_ENV"] ||= "development"

require 'sinatra/base'
require_relative 'models/user'
require_relative './data_mapper_setup'
require 'sinatra/flash'

class Chitter < Sinatra::Base
  enable :sessions
  set :session_secret, 'bob has one leg'
  register Sinatra::Flash

  get '/' do
    redirect '/users/new'
  end

  get '/users/new' do
    erb :'users/new'
  end

  post '/users' do
    @current_user = User.create(email: params[:Email],
                    password: params[:Password],
                    password_confirmation: params[:Confirm_Password])
    session[:email] = @current_user.email
    if @current_user.id.nil?
      flash[:wrong_password] = "Password and confirmation password do not match"
    end
    # flash[:repeat_email] = @current_user.errors[:email].join(" ")
    # session[:user_email] = @current_user.email
    redirect '/' if @current_user.id.nil?
    redirect '/users'
  end

  get '/users' do
    @email = session[:email]
    erb :'users/email'
  end

  get '/tweets/new' do
    erb :'tweets/new'
  end

  post '/tweets' do
  tweet = Tweet.create(text: params[:text])
    params[:tags].split(',').map(&:strip).each do |tag|
      tweet.tags << Tag.first_or_create(tag: tag)
    end
  tweet.save
  redirect '/tweets/new'
  end

  run! if app_file == $0
end
