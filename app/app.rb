
ENV['RACK_ENV'] ||= 'development'

require 'date'
require 'sun_times'
require 'sinatra/base'
require 'sinatra/flash'
require 'thin'
require 'mime-types'
require 'pony'
require_relative './environment'
require_relative './datamapper_setup'
require_relative './../sinatra_helpers/sinatra_helpers.rb'

class Chitter < Sinatra::Base
  include Helpers
  enable :sessions
  set :session_secret, ENV.fetch('SESSION_SECRET') { SecureRandom.hex(20) }

  configure do
    Pony.options = {
        via: :smtp,
        via_options: {
            address: 'smtp.sendgrid.net',
            port: '587',
            user_name: ENV['SENDGRID_USERNAME'],
            password: ENV['SENDGRID_PASSWORD'],
            authentication: :plain,
            enable_starttls_auto: true
        }
    }
  end

  helpers do
    def send_notification_email(posted_by_username, tagged_in_username)
      poster = User.first(id: posted_by_username)
      recipient = User.first(username: tagged_in_username[:tag])

      Pony.mail to: recipient['email'],
                from: 'tinyBlogger <noreply@tinyblogger.co.uk>',
                subject: "You've been tagged in a new post",
                body: "Hi #{recipient['first_name']}, we thought you might like to know " \
                "that #{poster['first_name']} #{poster['last_name']} just tagged you in a post!"
    end

    def send_confirmation_email(new_user)
      Pony.mail to: new_user['email'],
                from: 'tinyBlogger <noreply@tinyblogger.co.uk>',
                subject: 'Please confirm your email address',
                html_body: "<p>Hi #{new_user['first_name']}, thanks for signing up!</p><br>" \
                           "<p>Please click <a href='https://tinyblogger.herokuapp.com/confirm/#{new_user['confirmation_token']}'>here</a> to confirm your email address</p>"
    end
  end

  get '/' do
    @peeps = Peep.all(is_archived: false)
    erb :index
  end

  post '/' do
    redirect '/' unless current_user
    peep = Peep.create(body: params[:body],
    charcount: params[:body].length,
    likes: 0,
    time: Time.now,
    user_id: session[:user_id])
    hashtags = parse_hashtags(peep)
    usertags = parse_usertags(peep)
    hashtags.each do |hashtag|
      peep.hashtags << hashtag
      peep.save
    end
    usertags.each do |usertag|
      peep.usertags << usertag
      peep.save
    end
    usertags.each { |usertag| send_email(session[:user_id], usertag) }
    redirect '/'
  end

  get '/sign_up' do
    erb :sign_up
  end

  post '/create_user' do
    image = Image.new
    image.file = params[:image]
    image.save
    user = User.create(first_name: params[:first_name].capitalize,
     last_name: params[:last_name].capitalize,
     email: params[:email].downcase,
     username: params[:username].downcase,
     password: params[:password],
     password_confirmation: params[:password_confirmation])
    if params[:image]
      user.picture_url = "https://s3.eu-west-2.amazonaws.com/tinyblogger/uploads/user_pics/#{params[:image][:filename]}"
    else
      user.picture_url = "https://s3.eu-west-2.amazonaws.com/michaeljacobson/default_profile_picture.png"
    end
    user.confirmation_token = generate_confirmation_token
    user.save
    send_confirmation_email(user)
    session[:user_id] = user.id
    redirect '/'
  end

  post '/login' do
    user = User.authenticate(params[:username], params[:password])
    if user
      session[:user_id] = user.id
      redirect to('/')
    else
      erb :index
    end
  end

  get '/logout' do
    redirect '/' unless current_user
    session[:user_id] = nil
    redirect '/'
  end

  get '/peeps/:hashtag' do
    unarchived_peeps = []
    hashtag = Hashtag.all(conditions: ['lower(tag) = ?', params[:hashtag].downcase])
    peeps = hashtag ? hashtag.peeps : []
    peeps.each { |peep| unarchived_peeps << peep unless peep.is_archived }
    @peeps = unarchived_peeps
    erb :index
  end

  get '/like/:peep_id' do
    redirect '/' unless current_user
    peep = Peep.get(params[:peep_id])
    peep.likes += 1
    peep.save
    Like.create(peep_id: params[:peep_id], user_id: current_user.id)
  end

  get '/unlike/:peep_id' do
    redirect '/' unless current_user
    peep = Peep.get(params[:peep_id])
    peep.likes -= 1
    peep.save
    like = Like.first(user_id: current_user.id, peep_id: peep.id)
    like.destroy
  end

  post '/archive/:peep_id' do
    redirect '/' unless current_user
    peep = Peep.get(params[:peep_id])
    peep.is_archived = true
    peep.save
    redirect '/'
  end

  get '/archive' do
    redirect '/' unless current_user
    @peeps = Peep.all(user_id: current_user.id, is_archived: true)
    erb :index
  end

  get '/confirm/:confirmation_token' do
    @user_to_confirm = User.first(confirmation_token: params[:confirmation_token])
    erb :confirmation
  end

  post '/confirm' do
    user = User.authenticate(params[:username], params[:password])
    if user
      user.email_confirmed = true
      user.confirmation_token = 'used'
      user.save!
      session[:user_id] = user.id
    end
    redirect '/'
  end

  run! if $PROGRAM_NAME == __FILE__
end
