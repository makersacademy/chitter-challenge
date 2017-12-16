ENV["RACK_ENV"] ||= "development"
require 'sinatra/base'
require 'sinatra/flash'
require_relative 'data_mapper_setup'

class Chitter < Sinatra::Base
  enable :sessions
  set :session_secret, 'super secret'
  register Sinatra::Flash

  get '/home' do
    @peeps = Peep.all
    erb :home
  end

  get '/peep/new' do
    erb :'peep/new'
  end

  post '/peep/new' do
    peep = Peep.create(message: params[:peep], datetime: "#{Time.new.strftime("%A, %d %b %Y %l:%M %p")}")
    peep.save
    redirect '/home'
  end

  get '/users/new' do
    @user = User.new
    erb(:'signup')
  end

  post '/users/new' do
    @user = User.new(email_address: params[:email_address],
                             password: params[:password],
                password_confirmation: params[:password_confirmation])
    # if @user.save
    #   session[:user_id] = @user.id
    #   redirect '/links'
    # else
    #   flash.now[:notice] = "password mismatch, re-enter password"
    #   erb(:'signup')
    # end

  run! if app_file == $0
end
