require 'sinatra'
require 'sinatra/base'
require 'sinatra/reloader' if development?
require_relative './lib/peep'

class Chitter < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
    enable :sessions
  end

  get '/' do
    erb :index
  end

  get '/Peeps' do
    ENV['ENVIRONMENT'] = 'test'
    @peeps = Peep.all
    erb :view_peeps
  end

  get '/sign_up' do
    erb :sign_up
  end

  post '/confirm' do
    txt_chit_name = params['txt_chit_name']
    txt_chit_user_name = params['txt_chit_user_name']
    session[:user_name] = txt_chit_user_name
    txt_chit_email = params['txt_chit_email']
    txt_password = params['txt_password']

    connection = PG.connect(dbname: 'chitter_test')
    connection.exec("INSERT INTO chit_user (name, user_name, email, password) VALUES('#{txt_chit_name}', '#{txt_chit_user_name}', '#{txt_chit_email}', '#{txt_password}');")
    redirect '/confirm_sign_up'
  end

  get '/confirm_sign_up' do
    @user_name = session[:user_name]
    erb :confirm_sign_up
  end

  get '/sign_in' do
    erb :sign_in
  end

  run! if app_file == $PROGRAM_NAME
end
