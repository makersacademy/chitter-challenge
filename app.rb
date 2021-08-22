require 'sinatra/base'
require 'sinatra/reloader'
require './lib/peep.rb'
require './lib/user.rb'

class Chitter < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end

  enable :sessions

  get '/peeps/index' do
    @peep = Peep.all
    @logged_in_user = session[:logged_in_user]
    erb(:'peeps/index')
  end

  post '/peeps/create_peep' do
    Peep.create(message: params[:peep].strip, posted: DateTime.now.strftime('%d/%m/%_Y %_H:%_M'))
    redirect('/peeps/index')
  end

  get '/peeps/sign_up' do
    erb(:'peeps/sign_up')
  end

  post '/peeps/create_user' do
    User.create(handle: params[:handle_sign_up], password: params[:password_sign_up], email: params[:email_sign_up])
    redirect('/peeps/index')
  end

  post '/peeps/login' do
    session[:logged_in_user] = User.login(email: params[:email_login], password: params[:password_login])
    redirect('/peeps/index') 
  end

  run! if app_file == $0
end
