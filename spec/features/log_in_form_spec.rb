feature 'home page login form' do

  before do
    go_to_login
  end

  scenario 'displays log in form' do
    expect(page).to have_content('Log In')
    expect(page).to have_content('username')
    expect(page).to have_content('password')
  end

  scenario 'displays link to register form' do
    expect(page).to have_link('register new account')
  end

  scenario 'displays latest posts' do
    expect(page).to have_content('Lastest Posts')
  end

  scenario 'does not display form for new posts' do
    expect(page).to_not have_content('Create New Post')
  end
end
