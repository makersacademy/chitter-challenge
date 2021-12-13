feature 'View all messages' do
  scenario 'it should display all messages on chitter as anonymous guest' do
    visit('/')
    click_on('Sign in as a guest')
    expect(page).to have_content('Home')
  end

  scenario 'it should display all messages on chitter as logged in user' do
    login_in_and_peep
    fill_in('message', with: 'My second peep')
    click_on('Peep')
    fill_in('message', with: 'I am a peep too')
    click_on('Peep')
    expect(page).to have_content('My first peep')
    expect(page).to have_content('My second peep')
    expect(page).to have_content('I am a peep too')
  end
end
