# As a Maker
# So that I can post messages on Chitter as me
# I want to sign up for Chitter
feature 'Sign up' do
  scenario 'display welcome message to new users' do
    sign_up
    expect(page).to have_content('Welcome chuck')
  end

  scenario 'increase user count by one upon sign up' do
    expect{ sign_up }.to change(User, :count).by(1)
  end

  scenario 'password does not match password confirmation' do
      expect { sign_up(password_confirmation: 'wrong') }.not_to change(User, :count)
      expect(current_path).to eq('/sign_up') # current_path is a helper provided by Capybara
      expect(page).to have_content 'Password does not match the confirmation'
    end

  scenario 'A user cannot sign up with an invalid email address' do
    expect { sign_up(email: "invalid@email") }.not_to change(User, :count)
  end

  scenario 'A user cannot sign up with an email that is already registered' do
    sign_up
    visit '/sign_up'
    expect{ sign_up }.to_not change(User, :count)
    expect(page).to have_content('That email or username is already registered mate')
  end

  scenario 'An existing user can sign in' do
    sign_up
    visit '/sign_in'
    fill_in :email, with: 'chuckypdawg@gmail.com'
    fill_in :password, with: '12345678'
    click_button 'Sign in'
    expect(page).to have_content 'Welcome chuck'
    expect(User.count).to eq(1)
  end

  scenario 'A user cannot sign in without valid credentials' do
    sign_up
    visit '/sign_in'
    fill_in :email, with: 'chuckypdawg@gmail.com'
    fill_in :password, with: 'wrong password'
    click_button 'Sign in'
    expect(page).to have_content('The email or password is incorrect')
  end

  scenario 'A user can make a peep' do
    sign_up
    click_button 'Make a peep'
    fill_in :peep, with: 'I like to ride donkeys'
    click_button 'Post'
    expect(page).to have_content('I like to ride donkeys')
  end

  scenario 'allow users to log out' do
    sign_up
    click_button 'Log out'
    expect(page).to have_content('goodbye!')
    expect(page).to_not have_content('Welcome chuck')
  end

  scenario 'Peeps have time stamps upon creation' do
    sign_up
    click_button 'Make a peep'
    fill_in :peep, with: 'I like to ride donkeys'
    click_button 'Post'
    expect(page).to have_content (Time.now.asctime)
  end

   scenario 'users can reply to peeps' do
     sign_up
     click_button 'Make a peep'
     fill_in :peep, with: 'I like to ride donkeys'
     click_button 'Post'
     click_button 'reply'
     fill_in :reply, with: 'Me too!'
     click_button 'Reply'
     click_button 'reply'
     fill_in :reply, with: 'Reply number two!'
     click_button 'Reply'
     expect(page).to have_content 'Me too!'
   end
end
