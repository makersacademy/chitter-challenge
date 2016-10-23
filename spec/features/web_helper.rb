def create_account
  visit '/signup'
  fill_in 'name', with: 'Posie'
  fill_in 'email', with: 'posie@shlack.com'
  fill_in 'username', with: 'rgoll'
  fill_in 'password', with: '1234apple$'
  click_button 'Create account'
end

def publish_peep
  fill_in 'content', with: 'My first peep!'
  click_button 'Publish peep'
end

def publish_peep_1
  fill_in 'content', with: 'My second peep!'
  click_button 'Publish peep'
end

def publish_peep_2
  fill_in 'content', with: 'My third peep!'
  click_button 'Publish peep'
end
