require 'sinatra/base'
require 'sinatra/reloader'
require 'capybara'
require './lib/peep'

class Chitter < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end

  get '/' do
    @peeps = Peep.all_peeps
    erb(:index)
  end

  get '/new-peep' do
    erb(:new_peep)
  end

  post '/post' do
    Peep.create(message: params[:message])
    redirect '/'
  end
end
