ENV['RACK_ENV'] ||= 'development'

require 'sinatra/base'
require 'sinatra/flash'
require './lib/models/peep.rb'
require './lib/models/user.rb'
require './datamapper_setup.rb'

class Chitter < Sinatra::Base
  enable :sessions
  set :session_secret, 'N8xi£F9gCM'
  register Sinatra::Flash

  get '/login' do
    erb(:login)
  end

  post '/logged_out' do
    session[:Uid] = nil
    session[:Umail] = nil
    session[:Uname] = nil
    redirect '/login'
  end

  post '/logged_in' do
    user = User.first(username: params[:username])
    if user.nil?
      flash.next[:wrong] = true
      redirect '/login'
    end
    if (BCrypt::Password.new(user.password_hash) == params[:password])
      session[:Uid] = user.id
      session[:Umail] = user.email
      session[:Uname] = user.username
      redirect '/time_line'
    else
      flash.next[:wrong] = true
      redirect '/login'
    end
  end

  get '/sign_up' do
    erb(:sign_up)
  end

  post '/signed_up' do
    user = User.create(username: params[:user_name],
    email: params[:email],
    password: params[:password],
    password_confirmation: params[:confirm_password])
    if user.save
      session[:Uid], session[:Uname], session[:Umail] = user.id, user.username, user.email
      redirect '/time_line'
    else
      flash.next[:errors] = user.errors.full_messages
      redirect '/sign_up'
    end
  end

  get '/time_line' do
    @peeps = Peep.all
    @user = User.first(username: session[:Uname])
    erb(:time_line)
  end

  post '/addpeep' do
    @user = User.first(username: session[:Uname])
    peep = Peep.create(content: params[:peep], date_created: Time.now.strftime('%d/%m/%Y - %H:%M'),
    user_id: @user.id)
    if !@user.nil?
      @user.peep << peep
      @user.save
    end
    peep.save
    redirect '/time_line'
  end

end
