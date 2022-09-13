require 'pg'

class Peeps

  attr_reader :id, :peep, :created_on
  
  def initialize(id:, peep:, created_on:)
    @id  = id
    @peep = peep
    @created_on = created_on
  end

  def self.all
    # [
    #   "hello everyone",
    #   "Still got this bloomin lurgy and high temperature.",
    #   "Why is he sniffing so much?",
    #   "I am in the curry house",
    # ]
    connection = PG.connect(dbname: 'chitter')
    result = connection.exec("SELECT * FROM peeps ORDER BY id DESC;") #Ask DB to sort list descending by id
    # result.map { |message| message['peep'] }
    result.map do |message| 
      # message['peep']
      Peeps.new(id: message['id'], peep: message['peep'], created_on: message['created_on'])
    end
  end
end