require './lib/phoenix.rb'
require './lib/summoner.rb'
require 'sinatra'
require 'sinatra/base'
require 'sinatra/flash'
require 'envyable'
Envyable.load('config/env.yml')


class PhoenixController < Sinatra::Base
  enable :sessions
  set :session_secret, 'My Secret Session'
  register Sinatra::Flash

  get '/' do
    redirect '/phoenix'
  end

  get '/phoenix' do
    @summoner = "julesnuggy" #Summoner.find(session[:user_id]).username
    @phoenix = Phoenix.all
    erb(:index)
  end

  post '/phoenix/summon' do
    Phoenix.summon(params[:new_phoenix])
    redirect '/phoenix'
  end

  get '/phoenix/reraise' do
    @fenix = Phoenix.find(params[:reraise_id])
    erb(:reraise)
  end

  post '/phoenix/reraise/confirm' do
    Phoenix.reraise(params[:reraise_id], params[:reraise_text]) if params[:reraise_confirm] == "Confirm"
    redirect '/phoenix'
  end

  post '/phoenix/dismiss' do
    Phoenix.dismiss(params[:dismiss_id])
    redirect '/phoenix'
  end

  get '/phoenix/register' do
    session[:register] = params[:register]
    erb(:register)
  end

  post '/phoenix/register/submit' do
    session[:username] = params[:username]
    session[:email] = params[:email]
    session[:password] = params[:password]
    session[:pw_confirm] = params[:pw_confirm]

    if params[:reg_button] == "Submit"
      if session[:username].empty? || session[:email].empty? || session[:password].empty? || session[:pw_confirm].empty?
        flash[:warning] = "All fields must be filled!"
        redirect '/phoenix/register'
      elsif session[:password] != session[:pw_confirm]
        flash[:warning] = "Your passwords do not match!"
        redirect '/phoenix/register'
      elsif session[:password] == session[:pw_confirm]
        @summoner = Summoner.create(session[:username], session[:email], session[:password])
        session[:user_id] = @summoner.user_id
        flash[:success] = "A new summoner is born! Welcome, #{params[:username]}!"
        redirect '/phoenix'
      end
    elsif params[:reg_button] == "Cancel"
      flash[:info] = "Summoner registration cancelled."
      redirect '/phoenix'
    end
  end

  run! if app_file == $0
end
