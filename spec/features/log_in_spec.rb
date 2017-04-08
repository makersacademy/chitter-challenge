feature 'User log in' do
  scenario 'with correct credentials' do
    sign_up
    visit '/sessions/new'
    log_in
    expect(current_path).to eq '/peeps'
    expect(page).to have_content 'Logged in as Darth_Vader'
  end

  scenario 'email does not match records' do
    sign_up
    visit '/sessions/new'
    log_in(email:'dv')
    expect(current_path).to eq '/sessions'
    # expect(page).to have_content 'Logged in as Darth_Vader'
  end

  scenario 'email does not match records' do
    sign_up
    visit '/sessions/new'
    log_in(password:'hateyoda')
    expect(current_path).to eq '/sessions'
    # expect(page).to have_content 'Logged in as Darth_Vader'
  end
end
