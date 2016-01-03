class Peep
  include DataMapper::Resource

  property :id, Serial
  property :content, Text, :required => true
  property :created_at, EpochTime
  property :user_id, Integer

  belongs_to :user

  def how_long_ago
    time = seconds_difference.to_i

    case time
      when 0 then 'just now'
      when 1 then 'a second ago'
      when 2..59 then time.to_s+' seconds ago'
      when 60..119 then 'a minute ago' #120 = 2 minutes
      when 120..3540 then (time/60).to_i.to_s+' minutes ago'
      when 3541..7100 then 'an hour ago' # 3600 = 1 hour
      when 7101..82800 then ((time+99)/3600).to_i.to_s+' hours ago'
      when 82801..172000 then 'a day ago' # 86400 = 1 day
      when 172001..518400 then ((time+800)/(60*60*24)).to_i.to_s+' days ago'
      when 518400..1036800 then 'a week ago'
      else ((time+180000)/(60*60*24*7)).to_i.to_s+' weeks ago'
    end
  end

  def seconds_difference
    t1 = Time.now
    t2 = created_at
    (t1 - t2).to_i
  end
end
