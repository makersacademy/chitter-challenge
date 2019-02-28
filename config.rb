def read_config
  {
    'production' => {
      db_url: ENV['CHITTER_DB_URL']
    },
  
    'test' => {
      db_url: ENV['CHITTER_TEST_DB_URL']
    }
  }
end
