# file: app.rb
require 'sinatra'
require 'sinatra/reloader'
require_relative 'lib/database_connection'
require_relative 'lib/album_repository'
require_relative 'lib/artist_repository'

DatabaseConnection.connect

class Application < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
    also_reload 'lib/album_repository'
    also_reload 'lib/artist_repository'
  end

  get '/members/new' do
    # This route doesn't do much,
    # it returns the view with the HTML form.
    return erb(:new_member)
  end

  get '/peeps/new' do
    # This route doesn't do much,
    # it returns the view with the HTML form.
    return erb(:new_peep)
  end

  get '/' do # /chitter_home
    repo = PeepRepository.new
    @peeps = repo.all 

    return erb(:chitter_home) # this will connect to your .erb file, in views
  end

