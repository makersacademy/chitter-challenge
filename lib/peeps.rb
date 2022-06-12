# require 'pg'

class Peeps
  def self.all
    [
      "hello everyone",
      "Still got this bloomin lurgy and high temperature.",
      "Why is he sniffing so much?",
      "I am in the curry house",
    ]
  end
#     connection = PG.connect(dbname: 'chitter')
#     connection.exec("SELECT * FROM peeps;")
#     result.map { |message| message['peep'] }
#   end
end