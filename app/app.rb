require 'sinatra/base'
require 'sinatra/reloader'
require 'sinatra/activerecord'
require './lib/peep'
require './lib/user'


class Chitter < Sinatra::Base
  configure :development do
    # :nocov:
    register Sinatra::Reloader
    # :nocov:
  end
  register Sinatra::ActiveRecordExtension
  
  get '/' do
    @peeps = Peep.order(id: :desc)
    erb(:index)
  end

  get '/signup' do
    erb(:signup)
  end

  get '/new_peep' do
    erb(:new_peep)
  end

  post '/add_user' do
    user = User.new(full_name: params[:full_name], username: params[:username], email: params[:email], password: '')
    user.password = params[:password]
    user.save!
    redirect '/'
  end

  post '/add_peep' do
    Peep.create(text: params[:peep_text])
    redirect '/'
  end

  run! if app_file == $0
end
