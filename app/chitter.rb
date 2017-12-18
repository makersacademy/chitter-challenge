ENV['RACK_ENV'] ||= 'development'

require 'sinatra/base'
require_relative './models/peeps'
require_relative './data_mapper_setup'


# require 'database_cleaner'
#
# DatabaseCleaner.strategy = :truncation
# DatabaseCleaner.clean


class Chitter < Sinatra::Base
  enable :sessions
  set :session_secret, 'super_secret'

  get ('/') do
    @peeps = Peep.all
    erb(:index)
  end

  post('/peeps/new') do
    peep = Peep.create(message: params[:message])
    peep.save
    redirect('/peeps')
  end

  get('/peeps') do
    @peeps = Peep.all.reverse
    erb(:messages)
  end

  get('/users') do
    erb(:users)
  end

  post('/users/new') do
    user = User.create(email: params[:email], password: params[:pasword])
    session[:user_id] = user.id
    redirect('/')
  end

  helpers do
    def current_user
      @current_user ||= User.get(session[:user_id])
    end
  end



run! if app_file == $0
end
