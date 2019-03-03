require 'sinatra/base'

class Chitter < Sinatra::Base
  enable :sessions

  $peeps = ['Trump is a nob', 'Code is cool', 'Save the turtles']

  get '/chitter' do
    'Welcome to Chitter!'
    $peeps
    erb :index
  end

  get '/chitter/new' do
    erb :new
  end

  post '/chitter/save_new' do
    p peep = params[:peep]
    $peeps << peep
    redirect '/chitter'
  end

  run! if app_file == $0
end
