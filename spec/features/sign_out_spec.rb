# As a Maker
# So that I can avoid others posting messages on Chitter as me
# I want to log out of Chitter

feature 'Sign out' do

  let(:user) do
    User.create(name: 'Michael H',
                email: 'test@chitter.com',
                handle: 'mikeh91',
                password: 'password',
                password_confirmation: 'password')
  end

  scenario 'logs user out' do
    sign_in(email: user.email, password: user.password)
    click_button 'Sign out'
    expect(current_path).to eq '/'
    expect(page).to have_content 'You have signed out'
    expect(page).to have_selector("input[type=submit][value='Sign in']")
    expect(page).not_to have_selector("input[type=submit][value='Sign out']")
  end

end