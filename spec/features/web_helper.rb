require 'pg'

def empty
  con = PG.connect(dbname: 'chitter_fake')
  rs = con.exec "TRUNCATE chitter_posts"
end


def add_base_posts
  con = PG.connect(dbname: 'chitter_fake')
  rs = con.exec "INSERT INTO chitter_posts (post, time) VALUES ('tis almost Christmas!', '24.12.20')"

  rs = con.exec "INSERT INTO chitter_posts (post, time) VALUES ('Bring on 2021!!!', '24.12.20')"

  rs = con.exec "INSERT INTO chitter_posts (post, time) VALUES ('Goodbye cruel world', '24.12.20')"

end
