require 'sinatra'
require "sinatra/reloader"

class Application < Sinatra::Base
  configure :development do
    register Sinatra::Reloader 
    also_reload ''
    also_reload ''
  end

  get '/' do
    return #index page -> homepage (shows messages(peeps) w/ time) -> button for adding new messages
  end

  get '/signup' do
    return # sign up page -> leads to index page
  end

  post '/signup' do
    return # Successfully signed up -> link to home page (see if i can redirect page automatically to homepage)
  end

  get '/newpeep' do
    return # page for new peeps(messages) - see if i can make it popup on the same page instead
  end

  post '/newpeep' do
    return # New peep added -> see if i can redirect back to home page 
  end