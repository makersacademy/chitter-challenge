require 'sinatra'
require 'sinatra/base'
require 'sinatra/flash'
require './lib/peep'
require 'pg'

class Chitter < Sinatra::Base
  enable :sessions
  register Sinatra::Flash

  get('/') do
    @peeps = Peep.all
    erb(:index)
  end

  post('/add') do
    Peep.create(params[:text], params[:author])
    redirect('/')
  end

  get('/sign_up') do
    erb(:sign_up)
  end

  post('/sign_up') do
    User.create(params[:email], params[:password], params[:name], params[:username])
    redirect('/')
  end

end
