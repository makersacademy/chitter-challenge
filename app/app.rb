ENV['RACK_ENV'] ||= 'development'

require_relative 'dm_setup'
require 'rubygems'
require 'sinatra'

class Chitter < Sinatra::Base

  enable :sessions

  get '/' do
    erb(:index)
  end

  get '/peep' do
    Peep.update(user_id: session[:id])
    @peeps = Peep.all
    @user = session[:name]
    erb(:'peep/index')
  end

  post '/post_peep' do
    Peep.create(text: params[:message], created_at: Time.now, user_id: 1 )
    redirect '/peep'
  end

  post '/sign_up' do
    @user = User.create(name: params[:name], email: params[:email], password: params[:password])
    session[:name] = params[:name]
    session[:id] = @user.id
    redirect '/peep'
  end


  run! if app_file == $0
end
