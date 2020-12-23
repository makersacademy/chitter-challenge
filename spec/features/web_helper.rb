require 'pg'

def empty
  con = PG.connect(dbname: 'chitter_fake')
  rs = con.exec "TRUNCATE chitter_posts"
end


def add_base_posts
  con = PG.connect(dbname: 'chitter_fake')
  rs = con.exec "INSERT INTO chitter_posts (post) VALUES ('tis almost Christmas!')"

  rs = con.exec "INSERT INTO chitter_posts (post) VALUES ('Bring on 2021!!!')"

  rs = con.exec "INSERT INTO chitter_posts (post) VALUES ('Goodbye cruel world')"

end
