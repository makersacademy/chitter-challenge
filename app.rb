require 'sinatra/base'
require './lib/peeps'

class Chitter < Sinatra::Base

  get '/' do
    @peeps = Peeps.all
    erb :index
  end

  get '/new' do
    erb :new
  end

  post '/sign-up' do
    User.create(params[:username], params[:email], params[:password])
  end

  post '/peeps' do
    Peeps.create(params[:username], params[:content], Time.now)
    redirect '/'
  end

  run! if app_file == $0

end
