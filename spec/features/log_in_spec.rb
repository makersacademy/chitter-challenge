# As a Maker
# So that I can post messages on Chitter as me
# I want to log in to Chitter

feature 'Logging in' do

  scenario 'A user can with the correct credentials' do
    sign_up
    log_in
    expect(page).to have_content('Welcome, Wynndow')
  end

  scenario 'A user can\'t with an incorrect password' do
    sign_up
    click_button('Log out')
    log_in(password: 'wrong')
    expect(page).to have_content('Incorrect email or password')
    expect(page).not_to have_content('Welcome, Wynndow')
  end

  scenario 'A user can\'t with an incorrect email' do
    sign_up
    click_button('Log out')
    log_in(email: 'wrong@email.com')
    expect(page).to have_content('Incorrect email or password')
    expect(page).not_to have_content('Welcome, Wynndow')
  end

end
