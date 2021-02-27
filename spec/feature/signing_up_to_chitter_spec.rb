feature 'people can sign up for Chitter' do
  scenario 'when signing up from the homepage' do
    visit('/')
    click_link('Sign up for Chitter!')
    fill_in 'email', with: 'bobloblaw@lawblog.com'
    fill_in 'password', with: 'bobloblawslawblog'
    fill_in 'name', with: 'Bob Loblaw'
    fill_in 'username', with: 'bloblaw'
    click_button 'Submit'
    expect(page).to have_content('Welcome to Chitter, Bob Loblaw!')
  end
  scenario 'and are signed in after signing up' do
    visit('/')
    click_link('Sign up for Chitter!')
    fill_in 'email', with: 'bobloblaw@lawblog.com'
    fill_in 'password', with: 'bobloblawslawblog'
    fill_in 'name', with: 'Bob Loblaw'
    fill_in 'username', with: 'bloblaw'
    click_button 'Submit'
    expect(page).to have_content('You are currently logged in as bloblaw')
  end
end
