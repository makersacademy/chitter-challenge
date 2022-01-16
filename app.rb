require 'sinatra/base'
require 'sinatra/reloader'
require './lib/peep'
require 'time'
require './lib/user'



class Chitter < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
    also_reload './lib/peep'
    also_reload './lib/user'
  end

  get '/' do
    redirect '/peeps'
  end

  get '/peeps' do
    @peeps = Peep.all
    erb :peeps
  end

  get '/sign_up' do
    erb :sign_up
  end

  post '/register' do
    user = User.create(name: params['username'], username: params['username'], email: params['username'], password: params['username'])
    flash.next[:info] = 'Weclcome #{user.username}'
    redirect '/peeps'
  end

  post '/new_peep' do
    Peep.create(message: params['message'], user: User.username, time: Time.now.to_s)
    redirect '/peeps'
  end

  run if app_file == $0

end