
module Helpers

  def html(post)
    @liked = Like.first(user_id: current_user.id, peep_id: post.id) if current_user
    @unlike = "<a href='#' class='unlike' id='#{post.id}'><div class='likes_red'><img src='https://s3.eu-west-2.amazonaws.com/michaeljacobson/red_heart.png' class='heart_image'>#{post.likes}</div></a>"
    @archive = "<a href='/archive/#{post.id}' class='archive_button' id='#{post.id}'><img src='https://s3.eu-west-2.amazonaws.com/michaeljacobson/archive.png' class='archive_image'></a>"
    @like = "<a href='#' class='like' id='#{post.id}'><div class='likes_grey'><img src='https://s3.eu-west-2.amazonaws.com/michaeljacobson/grey_heart.png' class='heart_image'>#{post.likes}</div></a>"
    @logged_out_likes = "<div class='likes_grey_logged_out'><img src='https://s3.eu-west-2.amazonaws.com/michaeljacobson/grey_heart.png' class='heart_image'>#{post.likes}</div>"
  end

  def post_buttons(post)
    html(post)
    if current_user
      return "#{@unlike}\r\n#{@archive}" if @liked && current_user.id == post.user_id
      return @unlike if @liked && current_user != post.user_id
      return "#{@like}\r\n#{@archive}" if !@liked && current_user.id == post.user_id
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
      "Good evening, #{user.first_name}"
    elsif current_hour >= 12 && current_hour < 18
      return "Good afternoon, #{user.first_name}"
    else
      "Good morning, #{user.first_name}"
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
    hashtags
  end

  def parse_usertags(peep)
    usertags = []
    body = peep.body.delete(',.?!;:/')
    array = body.split(' ')
    array.each do |word|
      usertags << Usertag.create(tag: word[1..-1]) if word[0] == '@'
    end
    usertags
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
    peep_datetime.strftime('%b %-d')
  end

end
