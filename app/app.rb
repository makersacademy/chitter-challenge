require 'sinatra/base'
require 'data_mapper'
require './app/data_mapper_setup'

class App < Sinatra::Base

  set :views, proc { File.join(root, '..', 'app/views') }

  get '/peeps' do
    @peeps = Peep.all
    erb :'peeps/index'
  end

  get '/peeps/new' do
    erb :'peeps/new'
  end

  post '/peeps' do
    Peep.create(message: params[:message], time: Time.new)
    redirect to('/peeps')
  end

  get '/user/new' do
    erb :'user/new'
  end

  post '/user' do
    User.create(email: params[:email],
                password: params[:password])
    redirect to('/peeps')
  end



  run! if app_file == $0
end
