require 'bcrypt'

feature 'authentication' do
  scenario 'signed-up users can login with correct password' do
    name = 'Bob Geldof'
    username = 'begeldof'
    email = 'its.me@bobgeldof.com'
    password = 'bob123'

    visit('/users/new')
    fill_in('name', with: name)
    fill_in('username', with: username)
    fill_in('email', with: email)
    fill_in('password', with: password)
    click_button('Submit')
    expect(current_path).to eq '/peeps'

    visit '/sessions/new'
    fill_in('email', with: email)
    fill_in('password', with: password)
    click_button('Login')
    # post /login
    expect(current_path).to eq '/peeps'
    expect(page).to have_content(name)
    expect(page).to have_content(username)
  end

  scenario 'user who provides an email address not in database cannot log in' do
    email = 'invalid@email.com'
    password = 'xxx'

    visit 'sessions/new'
    fill_in('email', with: email)
    fill_in('password', with: password)
    click_button('Login')
    expect(current_path).to eq '/sessions/new'
    expect(page).to have_content('Please check email or password')
  end

  scenario 'user who provides an incorrect password cannot log in' do
    name = 'Bob Geldof'
    username = 'begeldof'
    email = 'its.me@bobgeldof.com'
    password = 'bob123'

    visit('/users/new')
    fill_in('name', with: name)
    fill_in('username', with: username)
    fill_in('email', with: email)
    fill_in('password', with: password)
    click_button('Submit')
    expect(current_path).to eq '/peeps'

    bad_password = 'bob124'

    visit '/sessions/new'
    fill_in('email', with: email)
    fill_in('password', with: bad_password)
    click_button('Login')
    expect(current_path).to eq '/sessions/new'
    expect(page).to have_content('Please check email or password')
  end
end
