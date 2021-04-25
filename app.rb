require 'sinatra/base'
require 'sinatra/reloader'

class ChitterChallenge < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end

  get '/' do
    redirect('/signup')
  end

  get '/signup' do
    'welcome to signup'
  end

  post '/signed_up' do
    # insert new user into chitter_users table
    redirect('/view_all')
  end

  get '/view_all' do
    'welcome to the view all page'
    # erb :view_all
  end

  get '/new_cheep' do
    'welcome to the new cheep page'
    # erb :new_cheep
  end

  post '/new_cheep_submitted' do
    # insert new cheep into chitter_peeps table
    redirect('/view_all')
  end
end
