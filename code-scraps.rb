
def same_day?(peep_datetime, current_datetime)
  peep_date = peep_datetime.strftime('%-d%-m%Y')
  current_date = current_datetime.strftime('%-d%-m%Y')
  peep_date == current_date
end

def same_hour?(peep_datetime, current_datetime)
  peep_hour = peep_datetime.strftime('%H').to_s
  current_hour = current_datetime.strftime('%H').to_s
  peep_hour == current_hour
end

def same_minute?(peep_datetime, current_datetime)
  peep_minute = peep_datetime.strftime('%M').to_s
  current_minute = current_datetime.strftime('%M').to_s
  peep_minute == current_minute
end

def peep_datetime(peep_datetime, current_datetime = Time.now)
  if same_day?(peep_datetime, current_datetime)
    if same_hour?(peep_datetime, current_datetime)
      if same_minute?(peep_datetime, current_datetime)
        "#{current_datetime.strftime('%S') - peep_datetime.strftime('%S')}s"
      end
      "#{current_datetime.strftime('%M') - peep_datetime.strftime('%M')}m"
    end
    "#{current_datetime.strftime('%H') - peep_datetime.strftime('%H')}h"
  end
  peep_datetime.strftime('%b %-d')
end
