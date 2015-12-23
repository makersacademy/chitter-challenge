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
    expect(page).to have_content 'Congratulations makermakerson, you have signed up to Chitter!'
  end

  scenario 'unsuccessfully and sees a password confirmation error' do
    visit '/user/new'
    fill_in(:name, with: 'Maker Makerson')
    fill_in(:email, with: 'maker@makerson.com')
    fill_in(:username, with: 'makermakerson')
    fill_in(:password, with: 'maker123')
    fill_in(:password_confirmation, with: 'maker456')
    click_button('Sign up')
    expect(page).to have_content 'Password does not match the confirmation'
  end

  xscenario 'unsuccessfully as username is already taken' do

  end

  xscenario 'unsuccessfully as email address has already been used' do

  end
end
