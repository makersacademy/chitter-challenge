require 'pg'

class Chitter
  attr_reader :peep, :user_id

  def inisialize(peep:, user_id:)
    @peep = peep
    @user_id = user_id
  end

  def self.peep_post(peep:, user_id:)
    time = Time.now.strftime('%H:%M')
    connect_to_database.exec("INSERT INTO peeps (peep, created_on, user_id) VALUES('#{peep}', '#{time}', '#{user_id}');")
  end

  def self.peep_all
    connect_to_database.exec("SELECT * FROM peeps")
  end

  def self.peep_delete(id:)
    connect_to_database.exec("DELETE FROM peeps WHERE id = #{id}")
  end

  private

  def self.connect_to_database
    if ENV['ENVIRONMENT'] == 'test'
      PG.connect dbname: 'chitter_app_test'
    else
      PG.connect dbname: 'chitter_app'
    end
  end

end
