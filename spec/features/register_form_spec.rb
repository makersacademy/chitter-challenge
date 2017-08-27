feature 'home page register form' do

  before do
    go_to_register
  end

  scenario 'displays register form' do
    expect(page).to have_content('Register New Account')
    expect(page).to have_content('name')
    expect(page).to have_content('email')
    expect(page).to have_content('username')
    expect(page).to have_content('password')
  end

  scenario 'displays link to login form' do
    expect(page).to have_link('login to existing account')
  end

  scenario 'displays latest posts' do
    expect(page).to have_content('Lastest Posts')
  end

  scenario 'does not display form for new posts' do
    expect(page).to_not have_content('Create New Post')
  end

end
