require 'sinatra/base'
require 'sinatra/reloader'
require 'sinatra/activerecord'
require 'bcrypt'
require_relative 'lib/mail_sender'
require_relative 'lib/peep'
require_relative 'lib/user'
require_relative 'lib/tag'

class Application < Sinatra::Base
  # allows user log in data to persist for whilst user in logged in
  enable :sessions
  # This refreshes the app code without having to restart the server with each change
  register Sinatra::ActiveRecordExtension
  configure :development do
    register Sinatra::Reloader
  end
 # This modifies the regular Sinitra::Base class initialize by adding a mail sender
 # parameter, super() then calls the default initialize.
  def initialize(mail_sender = MailSender.new)
    @mail_sender = mail_sender
    super()
  end

  get "/" do
    @peeps_reverse_chron_order = Peep.order(created_at: :desc)
    return erb(:index)
  end

  get '/signup' do
    return erb(:sign_up)
  end

  get '/login' do
    return erb(:log_in)
  end

  get '/logout' do
    session[:name] = nil
    session[:email_address] = nil
    return redirect('/')
  end

  post '/login' do
    email = params[:email_address]
    password = params[:password]

    @user = User.find_by(email_address: email)
    
    return redirect('/login') if @user.nil? || @user.password != password

    session[:name] = @user.name
    session[:email_address] = @user.email_address
    return erb(:log_in_confirmation)

  end

  # I'm not sure that these are truly authenticating. You could switch to another users page 
  # if you have logged in and then type the url of another user into your browser,
  # because this only checks that the session[:name]
  # is not nil.
   
  get '/:user/page' do
    return redirect('/login') if session[:name].nil?
    @peeps_reverse_chron_order = Peep.order(created_at: :desc)
    return erb(:user_page)
  end

  get '/:user/compose_peep' do
    return redirect('/login') if session[:name].nil?
    return erb(:compose_peep)
  end
  
  post '/new-user' do
    @name, email_address, password = params[:name], params[:email_address], params[:password]
    # encryption happens on User class creation
    new_user = User.new(name: @name, email_address: email_address, password: password)
    
    if new_user.valid?
      new_user.save
      return erb(:sign_up_confirmation)
    else
      return redirect('/signup')
    end
  end

  post '/user/new-peep' do
    new_peep_text, tag = params[:text], params[:tag]
    author = User.find_by(name: session[:name])
    new_peep = Peep.new(text: new_peep_text)
    new_peep.user = (author)

    unless tag.nil?
      tag_record = Tag.find_or_create_by(content: tag)
      new_peep.tags<<tag_record
      send_peep_alert(tag) if tag_is_user?(tag)
    end 

    new_peep.save
    return erb(:new_peep)
  end

  private

  def tag_is_user?(tag)
    User.find_by(name: tag).is_a?(User) ? true : false
  end

  def send_peep_alert(tag)
    user = User.find_by(name: tag)
    @mail_sender.send_peep_alert(user)
  end
end
