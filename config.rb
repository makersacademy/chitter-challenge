
class Config
  CONFIG = {
    'production' => {
      db_url: ENV['CHITTER_DB_URL']
    },
  
    'test' => {
      db_url: ENV['CHITTER_TEST_DB_URL']
    }
  }

  def self.read_config(env)
    CONFIG[env]
  end  
end