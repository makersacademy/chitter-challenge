# frozen_string_literal: true

class HandlePeeps

  def self.all
    @peeps = []
    peeps = DatabaseConnection.query("SELECT * FROM peeps ORDER BY id DESC")

    peeps.each do |peep|
      @peeps << { 'id' => peep['id'], 'peep' => peep['peep'], 'date' => peep['date'] }
    end
    @peeps
  end

  def self.add_peep(peep)
    DatabaseConnection.query("INSERT INTO peeps (peep, date) VALUES ('#{peep}', '#{Time.now}');")
  end
end
