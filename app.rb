require 'sinatra/base'
require './lib/peep'
require './lib/profile'

class Chitter < Sinatra::Base

  get '/' do
    erb :index, :layout => :layout
  end

  get '/signup' do
    erb :signup
  end

  post '/signup' do
    Profile.create(username: params[:username], name: params[:name], email: params[:email], password: params[:password])
    redirect '/all_peeps'
  end

  get '/all_peeps' do
    @peeps = Peep.all
    erb :all_peeps, :layout => :layout
  end

  post '/all_peeps' do
    Peep.create(peep: params[:peep])
    redirect '/all_peeps'
  end

  get '/login_in' do
    erb :login_in
  end

  post '/login_in' do
    redirect '/all_peeps'
  end

  # start the server if ruby file executed directly
  run! if app_file == $0

end
