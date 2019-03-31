require 'pg'

class Chitter

  def self.get_peeps

    if ENV['ENVIRONMENT'] == 'test'
      con = PG.connect :dbname => 'Chitter_test', :user => 'evelynblazquez'
    else
      con = PG.connect :dbname => 'Chitter', :user => 'evelynblazquez'
    end
    rs = con.exec "SELECT * FROM peeps ORDER BY datetime"
    result = rs.values

    rs.clear if rs
    con.close if con
    
    return result
  end
  
  def self.new_user(name, username, email, password)
    
    return result['id']
  end

  def self.validate_user(email, password)
    
    return result
  end

  def self.new_peep(text, user_id, name )
    
    
  end

end
