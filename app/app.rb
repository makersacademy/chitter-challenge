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
    peep = Peep.new(peep: params[:peep], created_at: DateTime.now)
    peep.save
    redirect ('/peeps/index')
    erb :'peeps/index'
  end

  get ('/user/new') do
    @user = User.new
    erb :'user/new'
  end

end
