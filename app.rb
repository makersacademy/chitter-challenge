ENV['RACK_ENV'] ||= 'development'

require 'sinatra/base'
require './lib/models/peep.rb'
require './lib/models/user.rb'
require './datamapper_setup.rb'

class Chitter < Sinatra::Base
  enable :sessions
  set :session_secret, 'N8xi£F9gCM'

  get '/login' do
    erb(:login)
  end

  get '/sign_up' do
    erb(:sign_up)
  end

  post '/signed_up' do
    user = User.create(username: params[:user_name],
    email: params[:email],
    password: params[:password],
    password_confirmation: params[:confirm_password])
    redirect '/time_line'
  end

  get '/time_line' do
    @peeps = Peep.all
    erb(:time_line)
  end

  post '/addpeep' do
    peep = Peep.create(content: params[:peep], date_created: Time.now.strftime('%d/%m/%Y - %H:%M'))
    peep.save
    redirect '/time_line'
  end

end
