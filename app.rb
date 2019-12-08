require 'sinatra/base'
require './lib/peep'
require './lib/user'

class Chitter < Sinatra::Base


  get '/' do
    'Chitter!'
  end

  get '/peeps' do
    @peeps = Peep.all
    erb:'peeps/index'
  end

  get '/post_peep' do
    erb:'peeps/post_peep'
  end

  post '/post_peep' do
    Peep.post(message: params[:message], handle: params[:handle], time: params[:time])
    redirect '/peeps'
  end

  get '/new' do
    erb:'new'
  end

  post '/users' do
    user = User.create(email: params[:email], password: params[:password])
    redirect '/peeps'
  end


  run if app_file == $0
end
