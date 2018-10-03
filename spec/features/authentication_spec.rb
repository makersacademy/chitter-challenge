feature 'Log in' do
  scenario 'user logs in successfully' do
    visit 'users/login'
    fill_in 'email', with: 'test@email.com'
    fill_in 'password', with: 'password'
    click_button('Log in')
    expect(current_path).to eq '/users/welcome'
    expect(page).to have_content 'Welcome to Chitter, test@email.com'
  end
  scenario 'user enters wrong password' do
    visit 'users/login'
    fill_in 'email', with: 'test@email.com'
    fill_in 'password', with: 'wrong password'
    click_button('Log in')
    expect(current_path).to eq '/users/login'
    expect(page).to have_content 'Wrong password'
  end
  scenario 'user account does not exist' do
    visit 'users/login'
    fill_in 'email', with: 'not_existent@email.com'
    fill_in 'password', with: 'password'
    click_button('Log in')
    expect(current_path).to eq '/users/login'
    expect(page).to have_content 'User does not exist'
  end
end

feature 'Sign up' do
  scenario 'User signs up' do
    visit '/users/signup'
    fill_in 'name', with: "Donald Drumpf"
    fill_in 'email', with: "donald@whitehouse.gov"
    fill_in 'username', with: "therealdonalddrumpf"
    fill_in 'password', with: "iloveputin"
    click_button('Sign up')
    expect(current_path).to eq '/users/welcome'
    expect(page).to have_content ('Welcome to Chitter, Donald Drumpf')
  end
  scenario 'User whose email is used signs up' do
    visit '/users/signup'
    fill_in 'email', with: "donald@whitehouse.gov"
    fill_in 'password', with: "iloveputin"
    click_button('Sign up')
    visit '/users/signup'
    fill_in 'email', with: "donald@whitehouse.gov"
    fill_in 'password', with: "iloveputin"
    click_button('Sign up')
    expect(current_path).to eq '/users/signup'
    expect(page).to have_content ('Email address is already taken.')
  end
end

feature 'Log out' do
  scenario 'User signs out' do
    visit 'users/login'
    fill_in 'email', with: 'test@email.com'
    fill_in 'password', with: 'password'
    click_button('Log in')
    visit '/peeps'
    click_button('Log out')
    expect(page).to have_content 'You have logged out'
  end
end
