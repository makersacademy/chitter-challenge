require 'sinatra'
require 'sinatra/activerecord'
require 'sinatra/reloader'
require_relative 'models/user'
require_relative 'models/peep'

class Application < Sinatra::Base
  enable :sessions
  # This allows the app code to refresh
  # without having to restart the server.
  configure :development do
    register Sinatra::ActiveRecordExtension
    register Sinatra::Reloader
  end

  get '/' do
    @peeps = Peep.order(created_at: :desc).first(5)
    
    return erb(:home)
  end

  get '/peeps' do

    @peeps = Peep.all.order(created_at: :desc)

    return erb(:peeps)
  end
  
  get '/signup' do
    
    return erb(:signup)
  end

  get '/signin' do
    
    return erb(:signin)
  end

  post '/signup/new' do
    @username = params[:username]

    user = User.create!(
      email: params[:email],
      username: @username,
      password: params[:password],
      password_confirmation: params[:password_confirmation]
    )
    
    return erb(:signup_success)
  end

  post '/signin/account' do
    @username = params[:username]
    password = params[:password]

    user = User.find_by_username(@username)
    
    if user && user.authenticate(password)
      session[:user_id] = user.id

      redirect '/account_page'
    else
      redirect '/signup'
    end
  end

  get '/account_page' do
    if session[:user_id] == nil
      
      return redirect('/signin')
    else
      id = session[:user_id]
      @username = User.find(id).username
  
      return erb(:new_peep)
    end
  end

  post '/peep' do
    content = params[:content]
    if content.empty?

      redirect '/account_page'
    else
      Peep.create!(content: content,
        user_id: session[:user_id],
        created_at: DateTime.now)
      
        redirect '/peeps'
    end
  end
end