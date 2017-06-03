ENV['RACK_ENV'] ||= "development"

require_relative 'datamapper_setup'
require 'sinatra/base'

class Chitter < Sinatra::Base
  enable :sessions

  get '/' do
    erb(:index)
  end

  get '/sign_up' do
    erb(:sign_up)
  end

  post '/create_user' do
    User.create(username: params[:username], password: params[:password])
  end

  get '/log_in' do
    erb(:log_in)
  end

  get '/new_peep' do
    erb(:new_peep)
  end

  post '/update_peeps' do
    Message.create(body: params[:message_body], posted_at: Time.now)
    redirect '/peeps'
  end

  get '/peeps' do
    @messages = Message.all
    erb(:peeps)
  end

end
