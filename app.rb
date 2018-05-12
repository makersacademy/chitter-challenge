require 'sinatra/base'
require './lib/users.rb'
require 'sinatra/flash'
require './lib/peeps.rb'

class Chitter < Sinatra::Base
  enable :sessions
  register Sinatra::Flash

  get '/chitter' do
    @peeps = Peeps.all
    @current_user = session[:username]
    erb :index
  end

  get '/sign_up' do
    erb :sign_up
  end

  post '/sign_up' do
    name, username, email, password = params[:name], params[:username], params[:email], params[:password]
    Users.create(name, username, email, password)
    redirect('/user_added')
  end

  get '/user_added' do
    erb :user_added
  end

  get '/sign_in' do
    erb :sign_in
  end

  post '/sign_in' do
    session[:username], session[:password] = params[:username], params[:password]
    redirect '/chitter'
  end

  get '/new_peep' do
    erb :new_peep
  end

  post '/new_peep' do
    current_user = session[:username]
    peep_text = params[:text]
    time = Time.now.strftime('%I:%M%P')
    Peeps.peep(current_user, time, peep_text)
    redirect '/chitter'
  end

  run! if app_file == $0
end
