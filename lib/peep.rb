class Peep 

  def self.all

  end

  def self.add(peep)

  end

  private

  def self.select_database
    if ENV['ENVIRONMENT'] == 'test'
      PG.connect(dbname: 'chitter_test')
    else
      PG.connect(dbname: 'chitter')
    end
  end

end