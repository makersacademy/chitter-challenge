require 'pg'

class Peeps
  def self.all
    # [
    #   "hello everyone",
    #   "Still got this bloomin lurgy and high temperature.",
    #   "Why is he sniffing so much?",
    #   "I am in the curry house",
    # ]
    connection = PG.connect(dbname: 'chitter')
    result = connection.exec("SELECT * FROM peeps ORDER BY id DESC;") #Ask DB to sort list descending by id
    p result
    result.map { |message| message['peep'] }
  end
end