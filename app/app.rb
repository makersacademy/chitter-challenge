ENV['RACK_ENV'] ||= 'development'

require 'data_mapper'
require 'sinatra/base'
require_relative 'data_mapper_setup'

class Chitter < Sinatra::Base

  enable :sessions
  set :session_secret, 'super_secret'

  get ('/') do
    redirect ('/peeps/index')
  end

  get ('/peeps/index') do
    @peeps = Peep.all
    erb :'peeps/index'
  end

  post ('/peeps') do
    peep = Peep.new(message: params[:message])
    peep.save
    redirect ('/peeps/index')
    erb :'peeps/index'
  end

  get ('/user/new') do
    erb :'user/new'
  end

post ('/user') do
   user = User.create(name: params[:name], email: params[:email], username: params[:username])
   session[:user_id] = user.id
   redirect ('/peeps/index')
end

get ('/logout') do
  session.clear
  redirect ('/peeps/index')
end

helpers do
  def current_user
    @current_user ||= User.get(session[:user_id])
  end
end

end
