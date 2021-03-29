require 'pg'

class Peep

  attr_reader :id, :peep, :time, :account

  def initialize(id:, peep:, time:, account:)
    @id = id
    @peep = peep
    @time = time
    @account = account
  end


  def self.all
      result = DatabaseConnection.query("SELECT * FROM peeps ORDER BY id desc;")
      result.map do |peep|
      Peep.new(id: peep['id'], peep: peep['peep'], time: peep['time'], account: peep['account'])
      end
    end

    def self.add(peep:, account:)
      if ENV['ENVIRONMENT'] == 'test'
        con = PG.connect :dbname => 'chitter_test'
      else
        con = PG.connect :dbname => 'chitter'
      end

      result = con.exec("INSERT INTO peeps (peep, account) VALUES('#{con.escape_string(peep)}', '#{con.escape_string(account)}') RETURNING id, peep, time, account;")
      Peep.new(id: result[0]['id'], peep: result[0]['peep'], time: result[0]['time'], account: result[0]['account'])
    end

    def self.delete(id:)
      if ENV['ENVIRONMENT'] == 'test'
        con = PG.connect :dbname => 'chitter_test'
      else
        con = PG.connect :dbname => 'chitter'
      end
      con.exec("DELETE FROM replies WHERE peep_id = #{id}")
      con.exec("DELETE FROM peeps WHERE id = #{id}")
    end

    def self.update(id:, peep:)
      if ENV['ENVIRONMENT'] == 'test'
        con = PG.connect(dbname: 'chitter_test')
      else
        con = PG.connect(dbname: 'chitter')
      end
      result = con.exec("UPDATE peeps SET peep = '#{con.escape_string(peep)}' WHERE id = #{id} RETURNING id, peep, time")
      Peep.new(id: result[0]['id'], peep: result[0]['peep'], time: result[0]['time'], account: [0][0])
    end

    def self.find(id:)
      if ENV['ENVIRONMENT'] == 'test'
        con = PG.connect(dbname: 'chitter_test')
      else
        con = PG.connect(dbname: 'chitter')
      end
      result = con.exec("SELECT * FROM peeps WHERE id = #{id};")
      Peep.new(id: result[0]['id'], peep: result[0]['peep'], time: result[0]['time'], account: [0][0])
    end

    def replies
      DatabaseConnection.query("SELECT * FROM replies WHERE peep_id = #{id} ORDER BY id desc;")
    end

end
