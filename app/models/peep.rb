class Peep
  include DataMapper::Resource

  property :id, Serial
  property :content, Text, required: true
  property :created_at, EpochTime
  property :user_id, Integer

  belongs_to :user

  def how_long_ago
    time = (Time.now - created_at).to_i

    case time
    when 0..1 then 'just now'
    when 2..59 then time.to_s+' seconds ago'
    when 60..119 then 'a minute ago' #120 = 2 minutes
    when 120..3_540 then (time/60).to_i.to_s+' minutes ago'
    when 3_541..7_100 then 'an hour ago' # 3600 = 1 hour
    when 7_101..82_800 then ((time+99)/3_600).to_i.to_s+' hours ago'
    when 82_801..172_000 then 'a day ago' # 86400 = 1 day
    when 172_001..518_400 then ((time+800)/(60*60*24)).to_i.to_s+' days ago'
    when 518_400..1_036_800 then 'a week ago'
    else ((time+180_000)/(60*60*24*7)).to_i.to_s+' weeks ago'
    end
  end

end
