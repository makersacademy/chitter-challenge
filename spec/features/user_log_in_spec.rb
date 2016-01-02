# As a Maker
# So that I can post messages on Chitter as me
# I want to log in to Chitter
feature 'User logs in' do
  scenario 'sucessfully and sees welcome message' do
    sign_up
    log_in
    expect(page).to have_content('Welcome, makermakerson!')
  end

  scenario 'unsuccessfully due to incorrect password' do
    sign_up
    visit '/sessions/new'
    fill_in(:email, with: 'maker@makerson.com')
    fill_in(:password, with: 'maker456')
    click_button('Sign in')
    expect(page).to have_content('Incorrect username or password.')
  end
end
