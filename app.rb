require 'sinatra/base'
require './lib/peep'
require './lib/user'

class ChitterApp < Sinatra::Base

  get '/user_authentication/sign_up' do
    erb(:'/user_authentication/sign_up')
  end

  post '/user_authentication/sign_up' do
    @user = User.sign_up(params[:user_name], params[:password])
    redirect '/peeps/peeps_list'
  end

  get '/peeps/peeps_list' do
    @peeps = Peep.list
    erb(:'/peeps/peeps_list')
  end

  post '/peeps/peeps_list' do
    Peep.add(params[:content])
    redirect '/peeps/peeps_list'
  end


end
