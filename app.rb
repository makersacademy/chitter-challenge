require 'sinatra/base'
require './lib/peep'
require './lib/user'

class Chitter < Sinatra::Base
  enable :sessions

  get('/') do
    @peeps = Peep.all
    @username = session[:username]
    erb(:'peeps/index')
  end

  post('/new') do
    Peep.create(peep: params[:peep])
    redirect('/')
  end

  get('/sign_up') do
    erb(:sign_up)
  end

  post('/sign_up') do
    User.create(username: params[:username], password: params[:password])
    session[:username] = params[:username]
    redirect('/')
  end

  run! if app_file == $0
end
