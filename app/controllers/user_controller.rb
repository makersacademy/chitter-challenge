require "sinatra/base"
require "sinatra/activerecord"
require "bcrypt"
require_relative "../models/user"
require_relative "./application_controller"
require_relative "../helpers/session_helper"

class UserController < Sinatra::Base
  include SessionHelper
  enable :sessions
  register Sinatra::ActiveRecordExtension
  configure do
    set :views, 'app/views'
  end 

  get "/sign_in" do 
    if logged_in?
      erb(:redirect_to_user_page)
    else
      erb(:sign_in)
    end 
  end 
    
  post '/sign_in' do
    user = User.find_by(username: params[:username])
    if user&.authenticate(params[:password])
      session[:user_id] = user.id
      erb(:redirect_to_user_page)
    else
      params[:username].empty? || params[:password].empty? 
      erb(:sign_in_blank)
    end
  end

  get '/sign_out' do 
    session.clear
    erb(:redirect_to_index)
  end 

  get "/user/:username" do
    if !logged_in?
      erb(:redirect_to_index)
    elsif params[:username] == current_user.username
      @peeps = Peep.order('time DESC')
      @replies = Reply.order('time ASC')
      @tagged_peeps = Peep.where("content ILIKE ?", 
      "%#{current_user.first_name}% #{current_user.last_name}%")
      erb(:user_home)
    else
      erb(:redirect_to_user_page)
    end
  end

  get "/user" do
    erb(:redirect_to_index)
  end

  get "/signup" do
    if logged_in?
      erb(:redirect_to_user_page)
    else
      erb(:signup)
    end
  end

  post "/signup" do
    if params[:username].empty? || 
      params[:email].empty? || 
      params[:password].empty? || 
      params[:password_verification].empty? || 
      params[:first_name].empty? || 
      params[:last_name].empty?
      erb(:sign_up_blank)
    else
      @user = User.create(username: params[:username], email: params[:email], 
password: params[:password], first_name: params[:first_name], last_name: params[:last_name])
      session[:user_id] = @user.id 
      erb(:user_created)
    end
  end

  get "/create_peep" do
    erb(:create_peep)
  end

  post "/create_peep" do
    @peep = Peep.create(content: params[:content], time: Time.now, user_id: session[:user_id])
    
    users = User.all
    users.each do |user|
      first_name = user.first_name
      last_name = user.last_name
      if params[:content].include?(first_name) && params[:content].include?(last_name)
        send_tag_email(user.first_name, user.email, params[:content])
      else
        nil
      end
    end
    erb(:peep_created_redirect)
  end

  get "/create_reply/:peep_id" do
    @peep_id = params[:peep_id]
    erb(:create_reply)
  end

  post "/create_reply/:peep_id" do
    @reply = Reply.create(content: params[:content], time: Time.now, user_id: session[:user_id], 
peep_id: params[:peep_id])
    erb(:reply_created_redirect)
  end
end
