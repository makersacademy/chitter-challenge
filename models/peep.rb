require 'pg'
require 'date'

class Peep

  def self.all
    if ENV['RACK_ENV'] == 'development'
      connection = PG.connect(dbname: 'chitter')
    elsif ENV['RACK_ENV'] == 'test'
      connection = PG.connect(dbname: 'chitter_test')
    end
    result = connection.exec "TABLE peeps"
    resarray = result.map { |peep| { :name => peep['name'].gsub(/[†]/, "'"), :peep => peep['peep'].gsub(/[†]/, "'"), :time => peep['time'], :date => peep['date'] } }
    all = Array.new
    resarray.each do |hash|
      pushed_hash = false
      all.each do |new_hash|
        if new_hash.has_key?(hash[:date])
          new_hash[hash[:date]].push(hash)
          pushed_hash = true
          new_hash[hash[:date]] = sortbytime(new_hash[hash[:date]])
        end
      end
      if pushed_hash == false
        all.push({ hash[:date] => [hash] })
      end
    end
    return sortbydate(all)
  end

  def self.add(name, peep_text)
    if ENV['RACK_ENV'] == 'development'
      connection = PG.connect(dbname: 'chitter')
    elsif ENV['RACK_ENV'] == 'test'
      connection = PG.connect(dbname: 'chitter_test')
    end
    connection.exec "INSERT INTO peeps (name, peep, time, date) VALUES ('#{name.gsub(/[']/, "†")}', '#{peep_text.gsub(/[']/, "†")}', '#{Time.now.strftime('%H:%M:%S')}', '#{Time.now.strftime('%Y-%m-%d')}')"
  end

  def self.convert_date(date)
    return "Today" if date == Date.today.to_s
    return "Yesterday" if date == Date.today.prev_day.to_s
    return date
  end

  # Need to learn how to make class methods private properly

  def self.sortbytime(array)
    # Why do I not have to call
    return array.sort_by { |hash| hash[:time] }
  end

  def self.sortbydate(array)
    return array.sort_by { |hash| hash.keys[0] }.reverse
  end

end
