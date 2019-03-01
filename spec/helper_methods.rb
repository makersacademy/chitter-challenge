def clean_test_database
  @conn = PG.connect(dbname: 'chitter_test')
  @conn.exec("TRUNCATE peeps, users;")
end

def create_first_peep
  visit('/')
  click_button('Add Peep')
  fill_in 'chitter_user', with: 'Mark'
  fill_in 'new_chitter_message', with: 'just writing some peeps...'
  click_button('Create Peep')
end
