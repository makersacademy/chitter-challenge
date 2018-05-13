require 'sinatra'

require_relative './lib/peep'

class Chitter < Sinatra::Base
  get '/' do
    erb(:index)
  end

  get '/peeps' do
    @peeps = Peep.all

    erb(:peeps)
  end

  get '/peeps/new' do
    erb(:peeps_new)
  end

  post '/peeps' do
    Peep.create(params['peep'])

    redirect('/peeps')
  end

  get '/users/new' do
    erb(:users_new)
  end

  post '/users' do
    User.create(params['email'], params['password'])

    redirect('/')
  end

  run! if app_file == $0
end
