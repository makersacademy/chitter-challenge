require 'sinatra/base'
require 'sinatra/reloader'
require 'sinatra/activerecord'
require 'bcrypt'
require_relative 'lib/peep.rb'
require_relative 'lib/user.rb'
require_relative 'lib/tag.rb'

class Application < Sinatra::Base
  # allows user log in data to persist for whilst user in logged in
  enable :sessions
  # This refreshes the app code without having to restart the server with each change
  register Sinatra::ActiveRecordExtension
  configure :development do
    register Sinatra::Reloader
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

  post '/login' do
    email = params[:email_address]
    password = params[:password]

    @user = User.find_by(email_address: email)
    
    return redirect('/login') if @user.nil?

    if @user.password == password
      session[:name] = @user.name
      session[:email_address] = @user.email_address
      return erb(:log_in_confirmation)
    else  
      return redirect('/login')
    end
  end


  # I'm not sure that these are truly authenticating. You could switch to another users page if you have logged in
  # and then type the url of another user into your browser, because this only checks that the session[:name]
  # is not nil.
   
  get '/:user/page' do
    return redirect('/login') if session[:name] == nil
    @peeps_reverse_chron_order = Peep.order(created_at: :desc)
    return erb(:user_page)
  end

  get '/:user/compose_peep' do
    return redirect('/login') if session[:name] == nil
    return erb(:compose_peep)
  end
  
  post '/new-user' do
    @name = params[:name]
    email_address = params[:email_address]
    encrypted_password = BCrypt::Password.create(params[:password])

    User.create(name: @name, email_address: email_address, password: encrypted_password)

    return erb(:sign_up_confirmation)
  end

  post '/user/new-peep' do
    new_peep_text = params[:text]
    author = User.find_by( name: session[:name])

    new_peep = Peep.new(text: new_peep_text)
    new_peep.user=(author)
    new_peep.save

    return erb(:new_peep)

  end
end
