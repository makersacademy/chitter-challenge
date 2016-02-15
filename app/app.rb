ENV['RACK_ENV'] ||= 'development'

require 'sinatra/base'
require 'sinatra/flash'

require_relative './models/user'
require_relative './models/peep'
require_relative './models/reply'
require_relative 'data_mapper_setup'
require_relative './helpers/helpers'

class Chitter < Sinatra::Base
  register Sinatra::Flash

  include Helpers

  enable :sessions
  set :session_secret, 'super secret'
  set :public_folder, 'static'
  # set :public_folder, Proc.new { File.join(root,'static') }

  get '/users/new' do
    @user = User.new
    erb :signup
  end

  post '/users/new' do
    @user = User.new(name: params[:name], username: params[:username], email: params[:email],
            password: params[:password], password_confirmation: params[:password_confirmation])
    if @user.save
      session[:user_id] = @user.id
      redirect('/session')
    else
      flash.now[:errors] = @user.errors.full_messages
      erb :signup
    end
  end

  get '/session' do
    @peeps = Peep.all.reverse
    erb :session
  end

  get '/session/new' do
    erb :login
  end

  post '/session/new' do
    user = User.authenticate(params[:username], params[:password])
    if user
      session[:user_id] = user.id
      redirect('/session')
    else
      flash.now[:errors] = ['The username or password is not correct']
      erb :login
    end
  end

  get '/session/end' do
    flash[:notice] = "Goodbye #{current_user.name}!"
    session[:user_id] = nil
    redirect('/session')
  end

  get '/session/peep' do
    if current_user
      erb :post_peep
    else
      redirect('/session/new')
    end
  end

  post '/session/peep' do
    time = Time.now
    peep = Peep.new(user: current_user, content: params[:content], time: time)
    peep.save!
    redirect('/session')
  end

  get '/session/reply/:peepid' do
    session[:peep_id] = params[:peepid]
    if current_user
      @peep = Peep.get(session[:peep_id])
      erb :reply
    else
      redirect('/session/new')
    end
  end

  post '/session/reply' do
    @peep = Peep.get(session[:peep_id])
    time = Time.now
    reply = Reply.new(peep: @peep, user: current_user, content: params[:content], time: time)
    reply.save!
    redirect('/session')
    erb :reply
  end
end
