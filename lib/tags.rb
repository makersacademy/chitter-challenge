class Tags

  def self.create(peepid,userid)
    sql("insert into user_tags(peep_id,user_id) values (#{peepid}, #{userid})")
  end

  private


    def self.sql(query)
      if ENV['ENVIRONMENT'] == 'test'
        connection = PG.connect(dbname: 'chitter_test')
      else
        connection = PG.connect(dbname: 'chitter')
      end
      return connection.exec(query)
    end

end
