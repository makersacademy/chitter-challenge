require_relative 'database_helpers.rb'

def add_user_and_log_in()
  add_user_to_DB()
  visit('/log-in') 
  fill_in('email', with: 'johnsmith@example.com')
  fill_in('password', with: 'password123')
  click_on('Log In')
end

def post_a_peep(peep_body='Hello Chitter!, this is a test peep.')
  visit('/')
  fill_in('peep_body', with: peep_body)
  click_on('Post Peep')
end