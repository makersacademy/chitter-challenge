require 'byebug'
require 'sinatra'

class Chitter < Sinatra::Application

  USERS = []

  get '/' do
    erb :index
  end

  post '/signup' do
    if params[:signup]
      USERS << params[:email]
      "welcome #{params['email']}"
    else
      if USERS.include? params[:email]
        "welcome #{params['email']}"
      else
        'Sorry, you have not signed up'
      end
    end
  end

end
