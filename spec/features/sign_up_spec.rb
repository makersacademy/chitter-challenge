feature 'sign up' do
  scenario 'new user' do
    sign_up('Peter Pan', 'peterpan', 'peter@neverland.com', 'password')

    expect(current_path).to eq '/peeps'
    expect(page).to have_content 'peterpan'
    expect(page).to have_content 'Log Out'
    expect(page).not_to have_content 'Sign Up'
    expect(page).not_to have_content 'Log In'
  end

  scenario 'username not unique' do
    sign_up('Peter Pan', 'peterpan', 'peter@neverland.com', 'password')
    click_on 'Log Out'

    sign_up('Peter Pan', 'peterpan', 'peter1@neverland.com', 'password')
    expect(current_path).to eq '/users/new'
    expect(page).to have_content 'Sorry the username you entered is already taken'
  end

  scenario 'email not unique' do
    sign_up('Peter Pan', 'peterpan', 'peter@neverland.com', 'password')
    click_on 'Log Out'

    sign_up('Peter Pan', 'peterpanner', 'peter@neverland.com', 'password')
    expect(current_path).to eq '/users/new'
    expect(page).to have_content 'Sorry the email you entered is already taken'
  end

end
