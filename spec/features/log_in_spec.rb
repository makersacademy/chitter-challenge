# As a Maker
# So that I can post messages on Chitter as me
# I want to log in to Chitter

feature 'Logging in' do

  scenario 'A user can with the correct credentials' do
    sign_up
    log_in
    expect(page).to have_content('Welcome, Wynndow')
  end

  scenario 'A user can\'t with the incorrect credentials' do
    sign_up
    log_in(password: 'wrong')
    expect(page).to have_content('Incorrect email or password')
    expect(page).not_to have_content('Welcome, Wynndow')
  end

end
