#As a Maker
#So that I can post messages on Chitter as me
#I want to sign up for Chitter
feature 'I want to sign up for Chitter' do
  scenario 'Allows a user to sign up' do
    expect { sign_up }.to change(User, :count).by(1)
    expect(page).to have_content('Welcome, test@mail.com')
    expect(User.first.email).to eq('test@mail.com')
  end
end



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
  visit_and_peep('Hello, world!')
  expect(page).to have_content('Hello, world!')
 end
  
 scenario 'I want to make sure a message gets stored in the database' do
  visit_and_peep('Message calling database!')
  peep = Peep.first
  expect(peep.message).to eq 'Message calling database!'
 end

  scenario 'I want to post another message (peep) and see both messages' do
    visit_and_peep("My first peep")
    visit_and_peep("My second peep")
    expect(page).to have_content('My first peep')
    expect(page).to have_content('My second peep')
  end
end
#As a maker
#So that I can see what others are saying  
#I want to see all peeps in reverse chronological order
feature 'I want to see all peeps in reverse chronological order' do
  scenario 'Create three peeps and view them in reverse order' do
    visit_and_peep('Created first ')
    visit_and_peep('Created second ')
    visit_and_peep('Created third ')
    expect(page).to have_content("Created third #{Time.now.strftime('%H:%M')}"\
    " Created second #{Time.now.strftime('%H:%M')} Created first")
  end
end 


#As a maker
#So that I can better appreciate the context of a peep
#I want to see the time at which it was made
feature 'I want to see the time at which it was made' do
  scenario 'View peeps with timestamps' do
    visit_and_peep('Peeped at: ')
    expect(page).to have_content("Peeped at: #{Time.now.strftime('%H:%M')}")
  end
end

