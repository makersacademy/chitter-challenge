def empty
  con = PG.connect(dbname: 'chitter_fake')
  rs = con.exec "TRUNCATE chitter_posts_fake"
end


def add_base_posts
  con = PG.connect(dbname: 'chitter_fake')
  rs = con.exec "INSERT INTO name (post) VALUES (It's almost Christmas!)"

  rs = con.exec "INSERT INTO name (post) VALUES (Bring on 2021!!!)"

  rs = con.exec "INSERT INTO name (post) VALUES (Goodbye cruel world)"

end
