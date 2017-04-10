feature 'User log in' do
  scenario 'with correct credentials' do
    sign_up
    click_button "Log out"
    visit '/sessions/new'
    log_in
    expect(current_path).to eq '/peeps'
    expect(page).to have_content 'Logged in as Darth_Vader'
  end

  scenario 'username does not match records' do
    sign_up
    click_button "Log out"
    visit '/sessions/new'
    log_in(username:'dv')
    expect(current_path).to eq '/sessions'
    # expect(page).not_to have_content 'Logged in as Darth_Vader'
  end

  scenario 'password does not match records' do
    User.create(password: 'Yoda')
    sign_up
    click_button "Log out"
    visit '/sessions/new'
    log_in(password:'hateyoda')
    expect(current_path).to eq '/sessions'
    # expect(page).not_to have_content 'Logged in as Darth_Vader'
  end

  scenario 'unless already logged in' do
    sign_up
    visit '/sessions/new'
    expect(current_path).to eq '/peeps'
  end
end
