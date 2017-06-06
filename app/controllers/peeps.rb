class Chitter < Sinatra::Base

  def peep_distance_of_time(from_time, to_time = Time.now)
    from_time = from_time.to_time if from_time.respond_to?(:to_time)
    to_time   = to_time.to_time   if to_time.respond_to?(:to_time)
  
    distance_in_minutes = (to_time - from_time).abs / 60.round
    distance_in_seconds = (to_time - from_time).abs.round

    case distance_in_minutes
      when 0..1
        case distance_in_seconds
          when 0..59 then "#{distance_in_seconds}s"
          else            "1m"
        end
      when 2..59    then "#{distance_in_minutes}m"
      when 60..1439 then "#{(distance_in_minutes.to_f / 60.0).round}h"
      else
        year = " %y" if from_time.year != Time.now.year
        from_time.strftime("#{from_time.day} %b#{year}")
    end
  end

  def full_name(user_id)
    first_name = User.get(user_id).first_name
    last_name  = User.get(user_id).last_name
    first_name + " " + last_name
  end

  def username(user_id)
    User.get(user_id).username
  end

  def avatar(user_id)
    avatar = User.get(user_id).avatar
    "/uploads/" + avatar
  end

  get '/peeps' do
    @peeps = Peep.all(:order => [:id.desc])
    erb :'peeps/index'
  end

  post '/peeps' do
    Peep.create(text: params[:text], user_id: current_user.id)
    redirect '/peeps'
  end

  get '/peeps/new' do
    erb :'peeps/new'
  end

end
