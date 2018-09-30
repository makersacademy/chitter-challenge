require 'sinatra/base'
require_relative 'lib/user'
require_relative 'lib/peep'
require_relative 'lib/init'

class Chitter < Sinatra::Base

  get '/' do
    erb :home
  end

  post '/write_peep' do
    erb :write_peep
  end

  get '/write_peep' do
    Peep.create(message: params['message'])
    redirect '/view_peeps'
  end

  post '/view_peeps' do
    erb :view_peeps
  end

  get '/view_peeps' do
    @peeps = Peep.view_all
    redirect '/write_peep'
  end


  run! if app_file == $0
end
