require 'sinatra/base'
require_relative './lib/peep_manager.rb'
require_relative './lib/users.rb'

class Chitter < Sinatra::Base

  get '/' do
    erb :welcome
  end

  get '/peep_feed' do
    @peeps = Peeps.all
    erb :peep_feed
  end

  get '/post_peep' do
    erb :post_peep
  end

  post '/post_peep' do
    @peep = params[:peep_field]
    Peeps.create(@peep)
    redirect('peep_feed')
  end

  get '/sign_up' do
    erb :sign_up
  end

  post '/sign_up' do
    Users.create(params[:name], params[:user_name], params[:email], params[:password])
    'sign up complete'
  end

  run! if app_file == $0
end
