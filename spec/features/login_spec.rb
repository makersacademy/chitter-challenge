# As a Maker
# So that I can post messages on Chitter as me
# I want to log in to Chitter

feature 'Sign in at Chitter' do
  before do
    visit '/'
    within('div#sign_up') do
      sign_up(name: 'Peter Jackson')
    end
    visit '/'
  end

  # As a Maker
  # So that I can use Chitter
  # I want to sign in with my email and password
  scenario 'I want to log in with my email and password' do
    within('div#log_in') do
      log_in
    end
    expect(page).to have_content('Welcome, Peter Jackson!')
  end

  scenario 'Wrong password or email invites me to try again' do
    within('div#log_in') do
      log_in(password: 'wrong')
    end
    expect(page).to have_content('Log in to Chitter')
  end

  scenario 'I want to log in after wrong log in' do
    within('div#log_in') do
      log_in
    end
    expect(page).to have_content('Welcome, Peter Jackson!')
  end
end
