require 'sinatra/base'
require_relative './data_mapper_setup'
require 'sinatra/flash'
require 'mailgun'

class Chitter < Sinatra::Base
  set :views, proc {File.join(root,'..','/app/views')}
  enable :sessions
  register Sinatra::Flash
  use Rack::MethodOverride
  set :session_secret, 'super secret'

  helpers do
    def current_user
      User.get(session[:user_id])
    end

    def send_email
      RestClient::Request.execute(
      url: "https://api:key-7af11fe0adc2a642e55d33744117e7d2"\
      "@api.mailgun.net/v3/sandbox1aad2b9369f348018e3b435a1026927c.mailgun.org/messages",
      :method => :post,
      :payload => {
      :from => 'Mailgun Sandbox <postmaster@sandbox1aad2b9369f348018e3b435a1026927c.mailgun.org>',
      :sender => 'Mailgun Sandbox <postmaster@sandbox1aad2b9369f348018e3b435a1026927c.mailgun.org>',
      :to => params[:email],
      :subject => "Welcome to Chitter",
      :text => "Welcome to Adrian's awesome Chitter site. " + params[:username] + ".Get Chittering!",
      :multipart => true
      },
      :headers => {
        :"h:X-My-Header" => "www/mailgun-email-send"
      },
      :verify_ssl => false
      )
    end

  end

  get '/' do
    redirect '/peeps'
  end

  get '/peeps' do
    @peeps = Peep.all
    erb :'peeps/index'
  end

  get '/peeps/new' do
    erb :'peeps/new_peep'
  end

  post '/peeps' do
    current_user.peeps.create(message: params[:message])
    redirect '/peeps'
  end

  get '/users/new' do
    @user = User.new
    erb :'users/new'
  end

  post '/users' do
    @user = User.create(email: params[:email],
                username: params[:username],
                password: params[:password],
                password_confirmation: params[:password_confirmation])

    if @user.save
      session[:user_id] = @user.id
      send_email
      redirect '/peeps'
    else
      flash.now[:errors] = @user.errors.full_messages
      erb :'users/new'
    end
  end

  get '/sessions/new' do
    erb :'sessions/new'
  end

  post '/sessions' do
    user = User.authenticate(params[:username], params[:password])
    if user
      session[:user_id] = user.id
      redirect '/peeps'
    else
      flash.now[:errors] = ["The username or password is incorrect"]
      erb :'sessions/new'
    end
  end

  delete '/sessions' do
    session.clear
    flash[:notice] = "goodbye!" #flash.now does not allow the redirect to happen.
    redirect '/peeps'
  end


run! if app_file == $PROGRAM_NAME
end
