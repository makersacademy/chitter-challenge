feature 'adding a new peep' do
  scenario 'logged in user can add a new peep' do
    visit 'users/login'
    fill_in 'email', with: 'test@email.com'
    fill_in 'password', with: 'password'
    click_button('Log in')
    visit '/peeps/new'
    fill_in 'peep', with: 'Another Trump peep. Sad.'
    click_button('Send peep')
    expect(current_path).to eq '/peeps'
    expect(page).to have_content 'Another Trump peep. Sad'
  end
  scenario 'user who is not logged in gets error message' do
    visit '/peeps/new'
    fill_in 'peep', with: 'Another Trump peep. Sad.'
    click_button('Send peep')
    expect(current_path).to eq '/peeps'
    expect(page).to have_content 'You need to be logged in to peep'
  end
end
