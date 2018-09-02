require 'sinatra/base'
require './lib/peep'
require './lib/profile'

class Chitter < Sinatra::Base

  get '/' do
    erb :index
  end

  get '/signup' do
    erb :signup
  end

  post '/signup' do
    Profile.create(username: params[:username], name: params[:name], email: params[:email], password: params[:password])
    erb :signup
    redirect '/'
  end

  get '/send_peep' do
    erb :send_peep
  end

  post '/send_peep' do
    Peep.create(peep: params[:peep])
    erb :send_peep
    redirect '/all_peeps'
  end

  get '/all_peeps' do
    @peeps = Peep.all
    erb :all_peeps
  end

  # start the server if ruby file executed directly
  run! if app_file == $0

end
