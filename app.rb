require 'sinatra/base'

class Chitter < Sinatra::Base
  get '/' do
    'This is a Chitter challenge'
  end

  get '/peeps' do
    erb :'peeps/peeps'
  end

  post '/peeps-add' do
    @peep = params[:peep]
    redirect '/peeps'
  end

  get '/peeps/new' do
    erb :'/peeps/new_peep'
  end

  run! if app_file == $0
end
