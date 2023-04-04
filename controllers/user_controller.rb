require 'sinatra/base'
require 'sinatra/reloader'
require './lib/user_repository'

class Signup < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
    set :public_folder, 'public'
    set :views, 'views'
  end

    get '/signup' do
        return erb(:signup)
    end

    get '/login' do
      return erb(:login)
    end

  end