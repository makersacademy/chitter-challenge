require 'sinatra/base'
require './lib/chitter'
require './lib/peep'
require './lib/user'

class ChitterManager < Sinatra::Base

  enable :sessions
  get '/chitter' do
    @chitter_log = Chitter.log
    @user_name = session[:username]
    erb :chitter_index
  end

  post '/chitter' do
    Chitter.add_peep(peep: Peep.new(peep: params[:peep], username: params[:username], post_time: Time.now))
    redirect '/chitter'
  end

  post '/sign_up' do
    session[:email] = params[:email]
    session[:username] = params[:username]
    session[:password] = params[:password]
    User.new(@email, @username, @password)
    redirect('/chitter')
  end

  run if app_file == $0
end
