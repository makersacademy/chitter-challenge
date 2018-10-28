feature 'sign up' do
  scenario 'user can click sign up button' do
    visit '/'
    click_button('Sign Up')
    expect(page).to have_content 'Enter your name'
    expect(page).to have_content 'Enter your username'
    expect(page).to have_content 'Enter your email address'
    expect(page).to have_content 'Enter your password'
  end

  scenario 'user can sign up' do
    visit '/'
    click_button('Sign Up')
    fill_in(:name, with: 'Imogen Misso')
    fill_in(:username, with: 'imogenmisso123')
    fill_in(:email, with: 'imogenmisso@hotmail.co.uk ')
    fill_in(:password, with: 'pink')
    click_button('Sign Up')
    expect(page).to have_content 'Logged in as Imogen Misso'
  end

  scenario 'user can only sign up with unique username' do
    visit '/'
    click_button('Sign Up')
    fill_in(:name, with: 'Imogen Misso')
    fill_in(:username, with: 'imogenmisso123')
    fill_in(:email, with: 'imogenmisso@hotmail.co.uk ')
    fill_in(:password, with: 'pink')
    click_button('Sign Up')
    visit '/user/logged_in'
    click_button('Log out')
    click_button('Sign Up')
    fill_in(:name, with: 'Diane Misso')
    fill_in(:username, with: 'imogenmisso123')
    fill_in(:email, with: 'dmisso@hotmail.co.uk ')
    fill_in(:password, with: 'pink')
    click_button('Sign Up')
    expect(page).to have_content 'That username is already in use, please choose another'
  end
end
