require 'sinatra'
require "sinatra/reloader"
require 'sinatra/base'
require 'active_record'
require 'pg'
require 'cgi'
require_relative 'lib/peep'
require_relative 'lib/user'
require_relative 'lib/send_email'

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

  def self.escape_html_all_params(params)
    # this santises all inputs
    # included as a self method so it could be tested in RSpec
    params.each { |k, v| params[k] = CGI.escapeHTML(v) }
  end

  get '/' do
    # loads the homepage

    # :user_id == nil as default, when a user logs in this changes to their User.id
    # :user_id.nil? is how we check whether a user is logged in
    # :user_id == nil => login => :user_id == 1
    @user_id = session[:user_id]
    # loads the username for the page if logged in
    @username = @user_id.nil? ? nil : User.find(@user_id).username
    # loads the last 20 Peeps to a timeline
    @peeps = Peep.last(20).sort_by { |peep| peep.date_time_created }.reverse
    erb(:index)
  end

  get '/login' do
    # loads the login form page

    # redirects back to the homepage if user is logged in already
    redirect to '/' unless session[:user_id].nil?
    # passing into variables for erb
    @user_id = session[:user_id]
    @sign_up = params[:sign_up] == 'true'
    # loads error messages in erb if needed
    @username_error = params[:username_error] == 'true'
    @password_error = params[:password_error] == 'true'
    erb(:login)
  end

  post '/login' do
    # verifies login info

    # returns error status 400 if no user is logged in or parameters are given
    return status 400 if !session[:user_id].nil? ||
      params[:password].nil? || params[:username].nil?
    Application.escape_html_all_params(params)

    # checks username is in database, nil if not
    user = User.find_by(username: params[:username])

    # redirect back to login page with username error message if user == nil
    redirect to '/login?username_error=true' if user.nil?

    # redirect back to login page with password error message if password doesn't match
    redirect to '/login?password_error=true' if params[:password] != user.password
    session[:user_id] = user.id
    redirect to '/'
  end

  get '/log-off' do
    # logs the user off

    # resets :user_id to nil
    session.delete(:user_id)
    erb(:log_off)
  end

  get '/sign-up/new' do
    # loads the sign up new users page

    # redirects back to homepage if a user is already logged on
    redirect to '/' unless session[:user_id].nil?
    Application.escape_html_all_params(params)

    # loads error messages in erb if needed
    @email_error = params[:email_error] == 'true'
    @username_error = params[:username_error] == 'true'
    erb(:sign_up)
  end

  post '/sign-up/new' do
    # verifies user info and creates a new user record if checks pass

    # returns error status 400 if a user is logged in or any parameters are nil
    Application.escape_html_all_params(params)
    return status 400 if !session[:user_id].nil? || params[:name].nil? || params[:email].nil? ||
      params[:username].nil? || params[:password].nil?

    # error messages to be passed back to /sign-up/new if needed
    error_params = []
    error_params << 'email_error=true' unless User.find_by(email: params[:email]).nil?
    error_params << 'username_error=true' unless User.find_by(username: params[:username]).nil?

    # redirects to /sign-up/new if any errors
    redirect to "/sign-up/new#{'?' + error_params.join('&')}" unless error_params.empty?

    # crates a new user
    User.create(
      name: params[:name],
      username: params[:username],
      email: params[:email],
      password: params[:password]
    )
    redirect to '/login?sign_up=true'
  end

  get '/peep/new' do
    # loads form for posting a new Peep

    # users cannot access this page if they are not logged in
    redirect to '/login' if session[:user_id].nil?
    erb(:peep)
  end

  post '/peep/new' do
    # creates a new Peep record
    Application.escape_html_all_params(params)

    # error status 400 if user isn't logged in or content is empty
    return 400 if session[:user_id].nil? || params[:content].nil?
    # by default creation time is current time, this line exists for testing
    session[:time_admin] = Time.now if session[:time_admin].nil?
    peep = Peep.create(
      content: params[:content],
      date_time_created: session[:time_admin],
      user_id: session[:user_id]
    )
    # checks to see if any users are mentioned in peep and emails them if so
    email_users(peep)
    redirect to '/'
  end

  post '/time-admin' do
    # allows custom time injection for testing
    # parameter = time
    # time format = "YYYY,MM,DD,HH,mm,SS"
    Application.escape_html_all_params(params)
    return 400 unless params[:password] == 'admin'
    # resets custom injection to Time.now
    return session.delete(:time_admin) if params[:time] == 'reset'
    time = params[:time].split(',').map(&:to_i)
    session[:time_admin] = Time.new(time[0], time[1], time[2], time[3], time[4], time[5])
    "Time set to #{session[:time_admin]}"
  end

  private
  
  def email_users(peep)
    # sends users an email if they are mentioned in the peep
    peep.content.split.each do |word|
      # checks username matches users in records, nil if not
      to_contact = User.find_by(username: word[1, word.size])
      if word[0] == '@' && !to_contact.nil?
        # sends an email through the SendEmail class in send_email.rb
        SendEmail.new(nil, to_contact.email).send_email(email_message(peep))
      end
    end
  end

  def email_message(peep)
    # creates email message
    username = "You've been mentioned in a Peep by @#{User.find(peep.user_id).username}!"
    content_date = "They wrote '#{peep.content}' on #{peep.date_time_created_formatted_string}."
    username + " " + content_date
  end
end
