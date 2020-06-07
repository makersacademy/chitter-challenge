require 'sinatra/base'
require_relative './lib/chitter'

class Chitter < Sinatra::Base

  get '/' do
    erb :index
  end

  post '/peep_or_view' do
    Chitterer.login(uname: params['uname'], psw: params['psw'])
    erb :peep_or_view
  end

  post '/add_peep' do
    erb :create_peep
  end

  post '/timeline' do
    Chitterer.create(chit: params['chit'], uname: params['uname'])
    @chits = Chitterer.all
    erb :all_peeps
  end

  get '/view_all' do
    @chits = Chitterer.all
    erb :all_peeps
  end

  run! if app_file == $0

end
