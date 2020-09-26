require 'pg'
require 'sinatra'

class Chitter < Sinatra::Base
  enable :sessions, :method_override
  #register Sinatra::Flash

  get '/' do
    erb :home
  end

  post '/' do
    #some ruby, adding a post to the db
    erb :home
  end

  get '/sign-up' do
    erb :sign_up
  end

  post '/sign-up' do
    # create user
    redirect '/'
  end

  run! if app_file == $0

end
