require 'sinatra/base'
require 'sinatra/flash'
require 'pg'
require './lib/message'
require './lib/user'
require 'data_mapper'

class Chitter < Sinatra::Base

  enable :sessions
  register Sinatra::Flash

  get '/' do
    session['username'] = nil
    database = ENV['TEST_DATABASE'] || 'chitter'
    DataMapper.setup(:default, "postgres://localhost:5432/#{database}")
    DataMapper.finalize
    erb :homepage
  end

  get '/signup' do
    erb :signup
  end

  post '/signup' do
    if User.first(:username => params['username'].downcase) != nil || User.first(:email => params['email'].downcase) != nil
      flash[:error_signup] = "Username or password already in use!"
      redirect '/signup'
    elsif params['password'] != params['password-confirm']
      flash[:error_signup] = "Please confirm password exactly!"
      redirect '/signup'
    else
      User.create(
        :username       => params['username'].downcase,
        :email          => params['email'].downcase,
        :password       => params['password']
      )
      redirect '/'
    end
  end

  post '/login' do
    attemped_login = User.first(:username => params['username'].downcase)
    if attemped_login.nil?
      flash[:error_login] = "Sorry, unknown username or password!"
    elsif attemped_login['password'] == params['password']
      session['username'] = params['username'].downcase
      redirect '/messageboard'
    end
    redirect '/'
  end

  post '/message' do
    redirect '/' if session['username'].nil?
    user = User.first(:username => session['username'])
    Message.create(
      :body       => params['message'],
      :userid     => user.id,
      :time => Time.now
    )
    redirect '/messageboard'
  end

  get '/messageboard' do
    redirect '/' if session['username'].nil?
    @username = session['username']
    data = Message.all(:order => [:time.desc])
    @messageboard = data.collect do |entry| {
        body: entry.body,
        username: User.first(:id => entry.userid)['username'],
        time: entry.time.strftime("%k:%M   %d/%m/%Y") }
    end

    p @messageboard
    erb :messageboard
  end

  run! if app_file == $0
end
