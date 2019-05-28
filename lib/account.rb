require 'pg'

class Account

attr_reader :id, :handle

  def initialize(id, handle)
    @id = id
    @handle = handle
  end

  def self.add(username)
    database.exec("INSERT INTO account (handle) VALUES('#{username}');")
  end

  def self.all
    data = database.exec( 'SELECT * FROM account;' )
    data.map do |account|
      self.new(account['id'], account['handle'])
    end
  end

  def self.by_handle(handle)
    data = database.exec( "SELECT * FROM account WHERE handle = '#{handle}';" )
    self.new(data[0]['id'], data[0]['handle'])
  end

  # def self.by_id(id)
  #   p "id is #{id}"
  #   data = database.exec( "SELECT * FROM account WHERE id = '#{id}';" )
  #   self.new(data[0]['id'], data[0]['handle'])
  # end

private

  def self.database
    if ENV['ENVIRONMENT'] == 'test'
      PG.connect(dbname: 'chitter_test')
    else
      PG.connect(dbname: 'chitter')
    end
  end

end
