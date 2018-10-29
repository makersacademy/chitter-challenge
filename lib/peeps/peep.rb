require 'pg'
class Peep
  def self.all
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname:'chitter_test')
    else
      connection = PG.connect(dbname: 'chitter')
    end
    result = connection.exec("SELECT * FROM peeps")
    result.map { |peep| peep['content'] }
  end
end

#INSERT INTO "public"."peeps" ("title", "id", "created_at", "content") VALUES ('first', DEFAULT, NOW(), 'First peep here!');
