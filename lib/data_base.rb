class DataBase
  attr_reader :connection

  DBNAME = {
    'test' => 'peep_manager_test',
    'development' => 'peep_manager'
  }.freeze

  def initialize
    @connection = PG.connect(dbname: DBNAME[ENV['ENVIRONMENT'] || 'development'])
  end
end