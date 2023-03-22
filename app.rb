require 'sinatra/base'
require 'sinatra/reloader'
# require './lib/database_connection'
# require './controllers/peeps_controller'
require './controllers/user_controller'


DatabaseConnection.connect('chitter')


class Application < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
    get '/' do
      return erb(:index)

    end

    get '/peeps' do
      return erb(:peeps)

    end

    # get '/signup' do
    #   return erb(:signup)

    # end

    get '/login' do
      return erb(:login)

    end


    post '/peeps/new' do
      return erb(:peep)

    end

    # GET /peeps/:id
    # GET /peeps/update
    # POST /peeps/:id/update
    # POST /peeps/:id/delete
end
end