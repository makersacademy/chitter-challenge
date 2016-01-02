# As a Maker
# So that I can post messages on Chitter as me
# I want to sign up for Chitter
feature 'User signs up' do
  scenario 'fills out name, email, password and username' do
    visit '/user/new'
    fill_in(:name, with: 'Maker Makerson')
    fill_in(:email, with: 'maker@makerson.com')
    fill_in(:username, with: 'makermakerson')
    fill_in(:password, with: 'maker123')
    fill_in(:password_confirmation, with: 'maker123')
  end

  scenario 'successfully and sees a confirmation message' do
    sign_up
    expect(page).to have_content 'Welcome, makermakerson!'
  end

  scenario 'unsuccessfully and sees a password confirmation error' do
    visit '/user/new'
    fill_in(:name, with: 'Maker Makerson')
    fill_in(:email, with: 'maker@makerson.com')
    fill_in(:username, with: 'makermakerson')
    fill_in(:password, with: 'maker123')
    fill_in(:password_confirmation, with: 'maker456')
    click_button('Submit')
    expect(page).to have_content 'Password does not match the confirmation'
  end

  scenario 'unsuccessfully as username is already taken' do
    sign_up
    sign_up
    expect(page).to have_content 'Username is already taken'
  end

  scenario 'unsuccessfully as email address has already been used' do
    sign_up
    sign_up
    expect(page).to have_content 'Email is already taken'
  end
end
