require 'sinatra/base'
require 'sinatra/reloader'
require './lib/peep.rb'
require './lib/user.rb'

class Chitter < Sinatra::Base

  configure :development do
    register Sinatra::Reloader
  end

  get '/' do
    @peeps = Peep.all
    erb :home_page
  end

  post '/new_peep' do
    Peep.create(peep_content: params[:peep_content])

    redirect :/
  end

  get '/login_page' do
    erb :login_page
  end

  get '/sign_up_page' do
    erb :sign_up_page
  end

  post '/sign_up_info' do
    @current_user = User.create(name: params[:Name], username: params[:Username], password: params[:Password])
    
    redirect :/
  end
  
  # dont delete this
  run! if app_file == $0
end