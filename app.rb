require 'sinatra/base'
require './lib/peep'


class Chitter < Sinatra::Base

  get '/' do
    "Hello Peep"
  end

  get '/chitter' do
    @peeps = Peep.all
    erb :"chitter/index"
  end

  post '/users' do
    user = User.create(name: params['name'], username: params['username'], email: params['email'], password: params['password'])
    session[:user_id] = user.id
    redirect '/peeps'
    end

  run! if app_file == $0
end
