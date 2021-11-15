require 'sinatra/base'
require 'sinatra/reloader'
require './lib/peep'
require './lib/user'

class Chitter < Sinatra::Base
  enable :sessions
  configure :development do
    register Sinatra::Reloader
  end

  get '/' do
    erb(:'index')
  end

  post '/signup' do
    User.create(email: params[:email], password: params[:password], name: params[:name], username: params[:username])
    redirect '/peeps'
  end

  get '/peeps' do
    erb(:'peeps', locals: { peeps: Peep.all})
  end

  post '/peeps' do
    Peep.create(name: params[:name], username: params[:username], message: params[:message], post_time: Time.new.strftime("%d/%m/%y - %R").to_s)
    redirect '/peeps'
  end

  run! if app_file == $0
end
