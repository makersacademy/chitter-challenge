class Peep < ActiveRecord::Base
  def username
    result = DBConnection.exec "
                      SELECT      username 
                      FROM        peeps p
                      INNER JOIN  users u
                      ON          p.poster_id = u.id
                      WHERE       p.id = #{self.id}
                      "
    result[0]["username"]
  end
end
