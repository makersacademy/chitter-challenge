require 'date'

module Timestamp

  def self.db_datetime_parse(db_timestamp)
    DateTime.strptime(db_timestamp, '%Y-%m-%d %H:%M:%S.%N%z')
  end

  def self.date_to_string(date)
    date.strftime('%d/%m/%Y %H:%M:%S')
  end

  def self.db_datetime_format(date)
    date = db_datetime_parse(date)
    date_to_string(date)
  end
end
