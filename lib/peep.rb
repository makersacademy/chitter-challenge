require 'pg'

class Peep
  def self.all

    attr_reader :peep_id, :user_id, :date_of_peep, :content

    def initialize(peep_id:, user_id:, date_of_peep:, content:)
      @peep_id  = peep_id
      @user_id = user_id
      @date_of_peep = date_of_peep
      @content = content
    end
  
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter')
    else
      connection = PG.connect(dbname: 'chitter_test')
    end

    result = connection.exec("SELECT * FROM peeps")
    result.map do |peep| #create new instances based on the number of rows in our db
      Peep.new(peep_id: peep['peep_id'], user_id: peep['user_id'], date_of_peep: peep['date_of_peep'], content: peep['content'])
    end
  end

#   def self.create(user_id:, url:)
#     if ENV['ENVIRONMENT'] == 'test'
#       connection = PG.connect(dbname: 'bookmark_manager_test')
#     else
#       connection = PG.connect(dbname: 'bookmark_manager')
#     end

#     connection.exec("INSERT INTO bookmarks (user_id, url) VALUES('#{user_id}', '#{url}')")
#   end
end