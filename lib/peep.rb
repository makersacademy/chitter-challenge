require 'pg'

class Peep

  attr_reader :user_handle, :post

  def initialize(user_handle:, post:)
    @user_handle = user_handle
    @post = post
  end

  def self.all
    if ENV['RACK_ENV'] == 'test'
      connection = PG.connect(dbname: 'chitter_test')
    else
      connection = PG.connect(dbname: 'chitter')
    end
    result = connection.exec("SELECT * FROM peeps;")
    result.map do |peep|
      Peep.new(user_handle: peep['user_handle'], post: peep['post'])
    end
  end
end
