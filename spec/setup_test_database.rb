require 'pg'

def setup_test_database

    p "setting up test database..."

    connection = PG.connect(dbname: 'tweet_form_test')

    connection.exec("TRUNCATE tweet_timeline;")

end