require 'sinatra/base'
require 'sinatra/reloader'
require 'capybara'

class Chitter < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end

  get '/' do
    erb(:index)
  end

  get '/new-peep' do
    erb(:new_peep)
  end

  post '/post' do
    
  end
end