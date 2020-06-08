require 'sinatra/base'
require_relative './lib/chitter.rb'
require_relative './lib/register.rb'

class ChitterApp < Sinatra::Base

  get '/' do
    erb :index
  end

  post '/peep' do
    Chitter.create(params[:new_peep])
    redirect '/view'
  end

  get '/view' do
    @peeps = Chitter.view
    erb :view
  end

  get '/signup' do
    erb :sign_up
  end

  post '/peep/register' do
    Register.sign_up(params[:name], params[:user_name], params[:email], params[:password])
    erb :registered
  end

  run! if app_file == $0
end
