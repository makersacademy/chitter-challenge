require "sinatra/base"

require_relative "./models/peep"
require_relative "./models/user"
require_relative "data_mapper_setup"

class ChitterApp < Sinatra::Base
  enable :sessions
  set :session_secret, 'super secret'

  get '/' do
    @peeps = Peep.ordering_reverse_chronological
    erb :welcome
  end

  get '/sign_up' do
    erb :sign_up
  end

  post '/sign_up' do
    user = User.create(
      email: params[:email],
      password: params[:password],
      name: params[:name],
      username: params[:username]
    )

    session[:user_id] = user.id
    redirect '/peeps'
  end

  get '/peeps' do

    if session[:user_id]
      user = User.find_by_user_id(session[:user_id])
      if user
        @user_username = user.username
      else
        "The user does not exist"
        redirect '/'
      end
    end

    @peeps = Peep.ordering_reverse_chronological

    erb :'/index'

  end

  post '/peeps' do
    user = User.find_by_user_id(session[:user_id])
    peep = Peep.create(
      message: params[:message],
      created_at: Time.now,
      user: user
    )
    
    redirect '/peeps'
  end

  get '/new_message' do
    erb :new_message
  end

  run if app_file == $0

end
