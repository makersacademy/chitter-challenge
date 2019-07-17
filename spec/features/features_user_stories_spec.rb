# As a Maker
# So that I can let people know what I am doing
# I want to post a message (peep) to chitter
feature 'posting a peep' do
  scenario 'check site is working first' do
    visit('/')
    expect(page).to have_content "Hello, world!"
  end
  scenario 'user can go to /create and add a peep to the db' do
    visit('/')
    click_button 'create'
    expect(page).to have_content "Please enter your message below"
    fill_in 'body', with: 'a sample peep'
    click_button 'submit'
    click_button 'view_peeps'
    expect(page).to have_content "a sample peep"
  end
end
