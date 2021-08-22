require 'sinatra/base'
require 'sinatra/reloader'
require './lib/peep.rb'
require './lib/user.rb'

class Chitter < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end

  get '/peeps/index' do
    @peep = Peep.all
    erb(:'peeps/index')
  end

  post '/peeps/create_peep' do
    Peep.create(message: params[:peep].strip, posted: DateTime.now.strftime('%d/%m/%_Y %_H:%_M'))
    redirect('/peeps/index')
  end

  get '/peeps/sign_up' do
    erb(:'peeps/sign_up')
  end

  post '/peeps/create_user' do
    User.create(handle: params[:handle], password: params[:password], email: params[:email])
    redirect('/peeps/index')
  end

  run! if app_file == $0
end
