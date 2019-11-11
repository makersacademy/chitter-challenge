require 'sinatra/base'
require './lib/database'

class Chitter < Sinatra::Base
  get '/' do
    erb :index
  end

  post '/sign_up' do
    User.create(
      :name => params[:name], 
      :username => params[:username], 
      :email => params[:email], 
      :password => params[:password]
      )      
    redirect '/home'
  end

  get '/home' do
    @peeps = Peep.all(:order => [:created_at.desc])
    erb :home
  end

  post '/create_peep' do
    @peep = params[:peep]
    Peep.create(:body => @peep, :user_id => 1)
    redirect '/home'
  end

  run! if app_file == $0
end
