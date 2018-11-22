class Peep

  def self.list
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_test')
    else
      connection = PG.connect(dbname: 'chitter')
    end

    result = connection.exec("SELECT content FROM peeps;")
    result.map { |content| content}

    ["Hello world!",
      "New to peeps",
      "Peep show"
    ]

  end

end
