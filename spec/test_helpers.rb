def truncate_tables
  controller = PG.connect :dbname => 'chitter_test'
  controller.exec ("TRUNCATE TABLE peeps")
  controller.exec ("TRUNCATE TABLE users")
end

def add_two_peeps
  visit '/chitter'
  click_on 'Compose a peep'
  fill_in 'peep', with: "What's peeping with YOU!?"
  click_on 'Share'
  click_on 'Compose a peep'
  fill_in 'peep', with: "I'm loving to peep"
  click_on 'Share'
end

def sign_up_as_penelope
  visit '/chitter'
  click_on 'Join Chitter'
  fill_in 'Name', with: 'Penelope Heart'
  fill_in 'Email', with: 'penel<3@makers.com'
  fill_in 'username', with: 'penelopeheartsyou'
  fill_in 'password', with: 'SweetHeart321'
  click_on 'Submit'
end

def sign_up_as_john
  visit '/chitter'
  click_on 'Join Chitter'
  fill_in 'Name', with: 'John Pie'
  fill_in 'Email', with: 'john<3@makers.com'
  fill_in 'username', with: 'johnjohn!'
  fill_in 'password', with: 'SweetJohn321'
  click_on 'Submit'
end
