require 'pg'

@@connection = PG.connect(dbname: 'chitter_test')


def account_creation_verifier(id:)

  @@connection.exec("SELECT * FROM user_accounts WHERE id = #{id}").first
end

def reset_table
  @@connection.exec("TRUNCATE user_accounts")
end
