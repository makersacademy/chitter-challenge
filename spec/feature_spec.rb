feature 'Homepage' do

  scenario 'land on homepage' do
    DatabaseCleaner.clean
    sign_up_2_users
    bunch_of_peeps
    visit '/'
    expect(page).to have_content 'chitter'
  end

  scenario 'see peeps' do
    visit '/'
    expect(page).to have_content 'Name'
  end

  scenario 'see peeps' do
    visit '/'
    expect(page).to have_content 'practice peep'
  end
end

feature 'User accounts' do
  scenario 'go to sign in' do
    visit '/'
    click_link 'sign in'
    expect(page).to have_content 'sign in'
  end

  scenario 'go to sign up' do
    visit '/'
    click_link 'sign up'
    expect(page).to have_content 'sign up'
  end

  scenario 'signed in' do
    sign_in
    expect(page).to have_content 'welcome Name'
  end

  scenario 'can log out' do
    sign_in
    click_button 'log out'
    expect(page).to have_link 'sign up'
  end

  scenario 'make peep' do
    sign_in
    fill_in 'peep', with: 'test new peep out'
    click_button 'submit'
    expect(page).to have_content 'test new peep out'
  end

  scenario 'can sign up' do
    visit '/'
    click_link 'sign up'
    fill_in 'name', with: 'Testy McTestface'
    fill_in 'email', with: 'new@emailcom'
    fill_in 'password', with: 'password'
    fill_in 'verify_password', with: 'password'
    click_button 'submit'
    expect(page).to have_content 'welcome Testy'
  end
end
