require 'sinatra/base'
require_relative 'datamapper_setup.rb'

class Chitter < Sinatra::Base
  enable :sessions unless test?
  set :session_secret, 'super secret'

  get '/' do
    @peeps = Peep.all.reverse
    erb :'peeps/index'
  end

  get '/peeps/new' do
    erb :'peeps/new'
  end

  post '/peeps/' do
    Peep.create(content: params['content'])
    redirect to('/')
  end

  get '/users/new' do
    erb :'users/new'
  end

  post '/users/' do
    user = User.new email: params['email'], password: params['password']
    if user.save
      session[:user_id] = user.id
      redirect to('/')
    end
  end

  private

  helpers do
    def formatted_time_stamp(time_stamp)
      time_stamp.ctime
    end

    def current_user
      user_id = session[:user_id]
      User.get(user_id)
    end
  end
end