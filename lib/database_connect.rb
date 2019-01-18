module DatabaseConnect

  def database_connect
    if ENV['RACK_ENV'] == 'test'
      PG.connect(dbname: 'chitter_test')
    else
      m PG.connect(dbname: 'chitter')
    end
  end

end
