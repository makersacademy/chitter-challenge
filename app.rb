require 'sinatra/base'
require 'sinatra/reloader'
require 'sinatra/activerecord'
require_relative 'lib/peep.rb'
require_relative 'lib/user.rb'
require_relative 'lib/tag.rb'

class Application < Sinatra::Base
  # allows user log in data to persist for whilst user in logged in
  enable :sessions
  # This refreshes the app code without having to restart the server with each change
  register Sinatra::ActiveRecordExtension
  configure :development do
    register Sinatra::Reloader
  end

  get "/" do
    @peeps_reverse_chron_order = Peep.order(created_at: :desc)
    return erb(:index)
  end

  get '/signup' do
    return erb(:sign_up)
  end

  get '/login' do
    return erb(:log_in)
  end

  post '/login' do
    email = params[:email_address]
    password = params[:password]

    # finds user with matching email and password
    @user = User.authenticate(email, password)
    # stores user details in session 
    session[:name] = @user.name
    session[:email_address] = @user.email_address
    
    return erb(:log_in_confirmation)
  end

  get '/user/page' do
    @peeps_reverse_chron_order = Peep.order(created_at: :desc)
    return erb(:user_page)
  end

  get '/user/compose_peep' do
    return erb(:compose_peep)
  end
  
  post '/new-user' do
    @name = params[:name]
    email_address = params[:email_address]
    password = params[:password]

    User.create(name: @name, email_address: email_address, password: password)

    return erb(:sign_up_confirmation)
  end

end
