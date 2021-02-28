require 'sinatra/base'

class Chitter < Sinatra::Base

  enable :sessions, :method_override

  get '/' do
    redirect '/peeps'
  end

  get '/peeps' do
    erb :"peeps/index"
  end

  get '/peeps/new' do
    erb :'peeps/new'
  end

  post '/peeps' do
    peep = params[:newpeep]
    redirect '/peeps'
  end

  run! if app_file == $PROGRAM_NAME
end
