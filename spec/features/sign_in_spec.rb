feature 'signing in' do
  let(:email) { 'peep.loverl337@booglemail.com' }
  let(:password) { 'verysecret123' }
  let(:name) { 'Shrimply Pibbles' }
  let(:username) { 'shrimplyp' }

  before do
    visit('/')
    new_user(email, password, name, username)
  end

  scenario 'correct inputs' do
    fill_in('username', with: username)
    fill_in('password', with: password)
    click_button('Log in')
    expect(page).to have_current_path('/peeps')
    expect(page).to have_content(name)
  end

  scenario 'incorrect password' do
    fill_in('username', with: username)
    fill_in('password', with: 'incorrect_password')
    click_button('Log in')
    expect(page).to have_current_path('/')
    expect(page).to have_text('Incorrect password')
  end

  scenario 'incorrect username' do
    fill_in('username', with: 'incorrect_username')
    fill_in('password', with: password)
    click_button('Log in')
    expect(page).to have_current_path('/')
    expect(page).to have_text('Incorrect username')
  end
end
