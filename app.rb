require 'sinatra/base'
require_relative './lib/chitter'

class Chitter < Sinatra::Base

  get '/' do
    erb :index
  end


  post '/all_peeps' do
    Chitterer.login(uname: params['uname'], psw: params['psw'])
    @chit = Chitterer.all
    erb :all_chits
  end

  post '/add_peep' do
    erb :chitter_timeline
  end

  post '/peep_added' do
    Chitterer.create(chit: params['chit'], uname: params['uname'])
    redirect('/all_peeps')
  end

  run! if app_file == $0

end
