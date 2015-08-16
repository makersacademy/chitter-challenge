require 'rubygems'
require 'sinatra/base'
require_relative 'datamapper_setup.rb'

class Chitter < Sinatra::Base
  get '/' do
    @peeps = Peep.all.reverse
    erb :'peeps/index'
  end

  get '/peeps/new' do
    erb :'peeps/new'
  end

  post '/peeps/new' do
    Peep.create(content: params['content'])
    redirect to('/')
  end

  get '/users/new' do
    erb :'users/new'
  end

  post '/users/new' do
    new_user = User.new email: params['email'], password: params['password']
    new_user.save
    redirect to('/')
  end

  private

  helpers do
    def formatted_time_stamp(time_stamp)
      time_stamp.ctime
    end
  end
end