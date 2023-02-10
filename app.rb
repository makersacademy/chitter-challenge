# file: app.rb
require 'sinatra'
require "sinatra/reloader"
require_relative 'lib/database_connection'
require_relative 'lib/peep_repository'
require_relative 'lib/uswer_repository'

DatabaseConnection.connect

class Application < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
    also_reload 'lib/album_repository'
    also_reload 'lib/artist_repository'
  end

  get '/' do
    return erb(:homepage) #this should use the all function in peeprepo to display all peeps in reverse chronological order
  end

  get '/newpeep' do
        #this provides the form to add a new user, which is then added through post/newpeep
  end

  post '/newpeep' do
  end

  get '/newuser' do
    #this provides the form to add a new user, which is then added through post/newuser
  end

  post '/newuser' do
  end

end