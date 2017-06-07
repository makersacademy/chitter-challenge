
ENV['RACK_ENV'] ||= 'development'

require 'date'
require 'sun_times'
require 'sinatra/base'
require 'sinatra/flash'
require 'thin'
require_relative './datamapper_setup'

class Chitter < Sinatra::Base
  enable :sessions
  set :session_secret, ENV.fetch('SESSION_SECRET') { SecureRandom.hex(20) }

  helpers do
    def post_buttons(post)
      @liked = Like.first(user_id: current_user.id, peep_id: post.id) if current_user
      @unlike = "<a href='#' class='unlike' id='#{post.id}'><div class='likes_red'><img src='http://michael-jacobson.co.uk/red_heart.png' class='heart_image'>#{post.likes}</div></a>"
      @delete = "<a href='/delete/#{post.id}' class='delete_button' id='#{post.id}'><img src='http://michael-jacobson.co.uk/trash.png' class='delete_image'></a>"
      @like = "<a href='#' class='like' id='#{post.id}'><div class='likes_grey'><img src='http://michael-jacobson.co.uk/grey_heart.png' class='heart_image'>#{post.likes}</div></a>"
      @logged_out_likes = "<div class='likes_grey_logged_out'><img src='http://michael-jacobson.co.uk/grey_heart.png' class='heart_image'>#{post.likes}</div>"
      if current_user
        return "#{@unlike}\r\n#{@delete}" if @liked && current_user.id == post.user_id
        return @unlike if @liked && current_user != post.user_id
        return "#{@like}\r\n#{@delete}" if !@liked && current_user.id == post.user_id
        return @like if !@liked && current_user.id != post.user_id
      else
        @logged_out_likes
      end
    end

    def daytime?
      date = Date.today
      latitude = 51.5074
      longitude = 0.1278
      sunrise_today = SunTimes.new.rise(date, latitude, longitude)
      sunset_today = SunTimes.new.set(date, latitude, longitude)
      Time.now > sunrise_today && Time.now < sunset_today
    end

    def greeting(user)
      current_hour = Time.now.strftime('%H').to_i
      if current_hour >= 18 && current_hour <= 23
        return "Good evening, #{user.first_name}"
      elsif current_hour >= 12 && current_hour < 18
        return "Good afternoon, #{user.first_name}"
      else
        return "Good morning, #{user.first_name}"
      end
    end

    def current_user
      @current_user ||= User.get(session[:user_id])
    end

    def parse_hashtags(peep)
      hashtags = []
      body = peep.body.delete(',.?!;:/')
      array = body.split(' ')
      array.each do |word|
        hashtags << Hashtag.create(tag: word[1..-1]) if word[0] == '#'
      end
      return hashtags
    end

    def same_day?(peep_datetime, current_datetime)
      peep_date = peep_datetime.strftime('%-d%-m%Y').to_i
      current_date = current_datetime.strftime('%-d%-m%Y').to_i
      peep_date == current_date
    end

    def same_hour?(peep_datetime, current_datetime)
      peep_hour = peep_datetime.strftime('%H').to_i
      current_hour = current_datetime.strftime('%H').to_i
      peep_hour == current_hour
    end

    def same_minute?(peep_datetime, current_datetime)
      peep_minute = peep_datetime.strftime('%M').to_i
      current_minute = current_datetime.strftime('%M').to_i
      peep_minute == current_minute
    end

    def peep_datetime(peep_datetime, current_datetime = Time.now)
      if same_day?(peep_datetime, current_datetime)
        if same_hour?(peep_datetime, current_datetime)
          if same_minute?(peep_datetime, current_datetime)
            return "#{current_datetime.strftime('%S').to_i - peep_datetime.strftime('%S').to_i}s"
          end
          return "#{current_datetime.strftime('%M').to_i - peep_datetime.strftime('%M').to_i}m"
        end
        return "#{current_datetime.strftime('%H').to_i - peep_datetime.strftime('%H').to_i}h"
      end
      return peep_datetime.strftime('%b %-d')
    end

  end

  get '/' do
    @peeps = Peep.all(is_archived: nil)
    erb :index
  end

  post '/' do
    peep = Peep.create(body: params[:body],
    charcount: params[:body].length,
    likes: 0,
    time: Time.now,
    user_id: session[:user_id])
    hashtags = parse_hashtags(peep)
    hashtags.each do |hashtag|
      peep.hashtags << hashtag
      peep.save
    end
    redirect '/'
  end

  get '/sign_up' do
    erb :sign_up
  end

  post '/create_user' do
    user = User.create(first_name: params[:first_name].capitalize,
     last_name: params[:last_name].capitalize,
     email: params[:email].downcase,
     username: params[:username].downcase,
     picture_url: params[:picture_url],
     password: params[:password],
     password_confirmation: params[:password_confirmation])
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
    session[:user_id] = nil
    redirect '/'
  end

  get '/peep' do
    erb :peep
  end

  get '/peeps/:hashtag' do
    unarchived_peeps = []
    hashtag = Hashtag.all(conditions: ['lower(tag) = ?', params[:hashtag].downcase])
    peeps = hashtag ? hashtag.peeps : []
    peeps.each { |peep| unarchived_peeps.push(peep) if peep.is_archived.nil? }
    @peeps = unarchived_peeps
    erb :index
  end

  get '/like/:peep_id' do
    peep = Peep.get(params[:peep_id])
    peep.likes += 1
    peep.save
    Like.create(peep_id: params[:peep_id], user_id: current_user.id)
  end

  get '/unlike/:peep_id' do
    peep = Peep.get(params[:peep_id])
    peep.likes -= 1
    peep.save
    like = Like.first(user_id: current_user.id, peep_id: peep.id)
    like.destroy
  end

  get '/delete/:peep_id' do
    peep = Peep.get(params[:peep_id])
    peep.is_archived = 'true'
    peep.save
    redirect '/'
  end

  get '/view_archive' do
    @peeps = Peep.all(user_id: current_user.id, is_archived: true)
    erb :index
  end

  run! if $PROGRAM_NAME == __FILE__
end
