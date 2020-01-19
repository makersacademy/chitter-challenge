require 'sinatra/base'
require './lib/peep'

class Chitter < Sinatra::Base

  get '/' do
    erb :index
  end

  get '/peep/new' do
    erb :'peeps/form'
  end

  post '/peep' do
    Peep.create(user_name: params[:user_name], user_handle: params[:user_handle], peep: params[:peep])
    redirect 'peep/view'
  end

  get '/peep/view' do
    @peeps = Peep.see_all
    p params
    erb :'peeps/peeps'
  end

  run! if app_file == $0

end
