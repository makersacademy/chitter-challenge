require 'sinatra/base'
require 'sinatra/flash'
require 'pg'
require_relative '../lib/peeps.rb'
require_relative '../lib/user.rb'

class Chitter < Sinatra::Base

  enable :sessions
  register Sinatra::Flash
  ENV['DATABASE'] ||= 'chitter'

  get('/') do
    erb(:index)
  end

  post('/') do
    Peeps.add(params['compose_tweet'])
    redirect('/')
  end

  get('/sign-up') do
    erb(:sign_up)
  end

  post('/sign-up') do
    User.add(params[:username], params[:email])
    redirect('/sign-up')
  end

  run! if app_file == $0
end