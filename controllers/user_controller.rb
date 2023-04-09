require 'sinatra/base'
require 'sinatra/reloader'
require './lib/user_repository'


class SignupController < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
    set :public_folder, 'public'
    set :views, 'views'
    also_reload 'lib/user_repository.rb' 
  end
  

  before do
    @user_repo = UserRepository.new
  end


  get '/login' do
    email_address = params[:email_address]
    password_hash = params[:password_hash]
    @user_repo = UserRepository.new
    user = @user_repo.find_by_email(email_address)
    return erb(:login)
  end

  get "/signup" do
    return erb(:signup)
  end


  post '/signup' do
      new_user = User.new
      new_user.name = params[:name]
      new_user.username = params[:username]
      new_user.email_address = params[:email_address]
      new_user.password_hash = params[:password_hash]
      @user_repo.create(new_user)
  
  return erb(:signup)
end

    # get '/login' do
    #   return erb(:login)
    # end

  #   get 'logout' do
  #     return erb(:logout)

  # end
end