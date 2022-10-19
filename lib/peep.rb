require_relative 'maker'

class Peep
    attr_accessor :id, :content, :created_at, :maker_id

    def find_maker_username
        sql = "SELECT username FROM makers WHERE id = $1"
        result_set = DatabaseConnection.exec_params(sql, [self.maker_id])
    
        maker = Maker.new
        maker.username = result_set[0]['username']
    
        return maker.username
      end
end