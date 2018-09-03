feature 'Posting Peeps' do 
  scenario 'user can post a peep to chitter as themselves' do
    
    visit '/'
    expect(page).to have_content 'Chitter'
    click_link 'Log In'
    fill_in :username, with: 'jnickson1'
    click_button 'Log In'
    expect(page).to have_link 'jnickson1'

    fill_in :peep, with: 'Hello world!'
    click_button 'Peep it!'
    expect(page).to have_content "[\"jnickson1\"] Hello world!"
  
  end
end

feature 'Log out' do
  scenario 'user logs out' do
    visit '/'
    click_link 'Log In'
    fill_in :username, with: 'jnickson1'
    click_button 'Log In'
    click_link 'jnickson1'
    click_button 'Log Out'
    expect(page).not_to have_content('jnickson1')
    expect(page).to have_content('Log In')
  end
end


# As a Maker
# So that I can let people know what I am doing  
# I want to post a message (peep) to chitter

# As a maker
# So that I can see what others are saying  
# I want to see all peeps in reverse chronological order

# As a Maker
# So that I can better appreciate the context of a peep
# I want to see the time at which it was made

# As a Maker
# So that I can post messages on Chitter as me
# I want to sign up for Chitter
