require 'pg'
class Chitterpeep
   
  attr_reader :time_sheet, :peep

  def initialize(time_sheet:, peep:)
   
    @time_sheet = time_sheet
    @peep = peep

  end
   
  def self.add_peep(peep)
    if ENV['ENVIRONMENT'] == 'test'
      conn = PG.connect(dbname: 'chitter_test')
    else
      conn = PG.connect(dbname: 'chitter')
    end

    result = conn.exec("INSERT INTO chitter_peeps (peep) VALUES('#{peep}')RETURNING peep, time_sheet")
    Chitterpeep.new(peep: result[0]['peep'], time_sheet: result[0]['time_sheet'])
  end

  def self.view_peep
    if ENV['ENVIRONMENT'] == 'test'
      conn = PG.connect(dbname: 'chitter_test')
    else
      conn = PG.connect(dbname: 'chitter')
    end
    
  
    result = conn.exec('SELECT * FROM chitter_peeps ORDER BY time_sheet DESC')
  
    # result.map { |peeps| peeps['peep','time_sheet']}
    result.map do |peeps|
      Chitterpeep.new(peep: peeps['peep'], time_sheet: peeps['time_sheet'])
    end
  end
end