feature 'Log in' do
  scenario 'user can log out and in again' do
    sign_up('Peter Pan', 'peterpan', 'peter@neverland.com', 'password')
    click_on 'Log Out'

    expect(current_path).to eq '/'
    expect(page).to have_selector(:link_or_button, 'Sign Up')
    expect(page).to have_selector(:link_or_button, 'Log In')
    expect(page).not_to have_selector(:link_or_button, 'Log Out')
    expect(page).not_to have_content 'peterpan'
  
    click_on 'new-session'

    fill_in 'username', with: 'peterpan'
    fill_in 'password', with: 'password'

    click_on 'log-in-form'

    expect(current_path).to eq '/peeps'
    expect(page).to have_content 'peterpan'
    expect(page).to have_content 'Log Out'
    expect(page).not_to have_content 'Sign Up'
    expect(page).not_to have_content 'Log In'
  end

  scenario 'username does not exist' do
    sign_up('Peter Pan', 'peterpan', 'peter@neverland.com', 'password')
    click_on 'Log Out'

    click_on 'new-session'

    fill_in 'username', with: 'peterpan1'
    fill_in 'password', with: 'password'

    click_on 'log-in-form'

    expect(current_path).to eq '/users/login'
    expect(page).to have_content 'Sorry this username does not exist'
  end

  scenario 'password is incorrect' do
    sign_up('Peter Pan', 'peterpan', 'peter@neverland.com', 'password')
    click_on 'Log Out'

    click_on 'new-session'

    fill_in 'username', with: 'peterpan'
    fill_in 'password', with: 'passwordd'

    click_on 'log-in-form'

    expect(current_path).to eq '/users/login'
    expect(page).to have_content 'Incorrect password entered'
  end
end
