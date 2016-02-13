#As a Maker
#So that I can post messages on Chitter as me
#I want to sign up for Chitter

#As a Maker
#So that I can post messages on Chitter as me
#I want to log in to Chitter

#As a Maker
#So that I can avoid others posting messages on Chitter as me
#I want to log out of Chitter

#As a Maker
#So that I can let people know what I am doing  
#I want to post a message (peep) to chitter
feature 'I want to post a message (peep) to chitter' do
 scenario 'User can post a message and view it on the main page' do
  custom_message = 'Hello, world! This is my first peep!'
  visit '/'
  click_link('Compose Peep')
  fill_in :message, with: custom_message
  click_button 'Peep'
  expect(page).to have_content(custom_message)
  
 end
end
#As a maker
#So that I can see what others are saying  
#I want to see all peeps in reverse chronological order

#As a maker
#So that I can better appreciate the context of a peep
#I want to see the time at which it was made
