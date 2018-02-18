require 'sinatra/base'
require 'pg'
require_relative "./lib/peep"
require_relative "./lib/user"
require_relative "./database_setup"


class Chitter < Sinatra::Base

  get '/' do
    redirect to '/peeps'
  end

  get '/peeps' do
    @peeps = Peep.all
    erb :index
  end

  post '/peeps' do
    Peep.create(params[:peep])
    redirect to '/peeps'
  end

  get '/new_user' do
    erb :new_user
  end

  post '/users' do
    User.create(params)
  end
end
