feature 'Log in' do
  scenario 'signed up user can log in again' do
    sign_up('Peter Pan', 'peterpan', 'peter@neverland.com', 'password')
    click_on 'Log Out'
    log_in('peterpan', 'password')
    
    expect(current_path).to eq '/peeps'
    expect(page).to have_content 'peterpan'
    expect(page).to have_content 'Log Out'
    expect(page).not_to have_content 'Log In'
  end

  scenario 'username does not exist' do
    sign_up('Peter Pan', 'peterpan', 'peter@neverland.com', 'password')
    click_on 'Log Out'
    log_in('peterpan1', 'password')

    expect(current_path).to eq '/users/login'
    expect(page).to have_content 'Sorry this username does not exist'
  end

  scenario 'password is incorrect' do
    sign_up('Peter Pan', 'peterpan', 'peter@neverland.com', 'password')
    click_on 'Log Out'
    log_in('peterpan', 'passwordd')

    expect(current_path).to eq '/users/login'
    expect(page).to have_content 'Incorrect password entered'
  end
end
