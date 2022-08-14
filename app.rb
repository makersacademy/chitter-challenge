require 'sinatra'
require "sinatra/reloader"
require 'sinatra/base'
require 'active_record'
require 'pg'
require 'cgi'
require_relative 'lib/peep'
require_relative 'lib/user'

ActiveRecord::Base.establish_connection(
  adapter:  'postgresql',
  database: 'chitter'
)

class Application < Sinatra::Base

  configure :development do
    register Sinatra::Reloader
    also_reload 'lib/peep'
    also_reload 'lib/user'
    enable :sessions
  end

  def self.escape_html_all_params(params) # santises all inputs
    params.each { |k, v| params[k] = CGI.escapeHTML(v) }
  end
  # get /\/albums\/([0-9]+)/ do

  get '/' do # homepage
    p 1
    @user_id = session[:user_id]
    @username = @user_id.nil? ? nil : User.find(@user_id).username
    @peeps = Peep.last(20).sort_by { |peep| peep.date_time_created }.reverse
    erb(:index)
  end

  get '/login' do # Login page
    redirect to '/' unless session[:user_id].nil?
    @user_id = session[:user_id]
    @sign_up = params[:sign_up] == 'true'
    @username_error = params[:username_error] == 'true'
    @password_error = params[:password_error] == 'true'
    erb(:login)
  end

  post '/login' do
    return status 400 if !session[:user_id].nil? ||
      params[:password].nil? || params[:username].nil?
    Application.escape_html_all_params(params)
    user = User.find_by(username: params[:username])
    redirect to '/login&username_error=true' if user.nil?
    redirect to '/login&password_error=true' if params[:password] != user.password
    session[:user_id] = user.id
    redirect to '/'
  end

  post '/log-off' do
    session.delete(:user_id)
    erb(:log_off)
  end

  get '/sign-up/new' do # Sign up page
    redirect to '/' unless session[:user_id].nil?
    Application.escape_html_all_params(params)
    @email_error = params[:email_error] == 'true'
    @username_error = params[:username_error] == 'true'
    erb(:sign_up)
  end

  post '/sign-up/new' do
    return status 400 if !session[:user_id].nil? || params[:name].nil? || params[:email].nil? ||
      params[:username].nil? || params[:password].nil?
    Application.escape_html_all_params(params)
    error_params = ""
    error_params += '&email_error=true' unless User.find_by(email: params[:email]).nil?
    error_params += '&username_error=true' unless User.find_by(username: params[:username]).nil?
    redirect to "/sign-up/new#{error_params}" unless error_params.empty?
    User.create(
      name: params[:name],
      username: params[:username],
      email: params[:email],
      password: params[:password]
    )
    redirect to '/login&sign-up=true'
  end

  get '/peep/new' do
    redirect to '/login' if session[:user_id].nil?
    erb(:peep)
  end

  post '/peep/new' do
    Application.escape_html_all_params(params)
    return 400 if session[:user_id].nil? || params[:content].nil?
    session[:time_admin] = Time.now if session[:time_admin].nil?
    Peep.create(
      content: params[:content],
      date_time_created: session[:time_admin],
      user_id: session[:user_id]
    )
    redirect to '/'
  end

  post '/time-admin' do
    Application.escape_html_all_params(params)
    return 400 unless params[:password] == 'admin'
    if params[:time] == 'reset'
      session.delete(:time_admin)
      return "Time reset"
    end
    time = params[:time].split(',').map(&:to_i)
    session[:time_admin] = Time.new(time[0], time[1], time[2], time[3], time[4], time[5])
    "Time set to #{session[:time_admin]}"
  end
end
