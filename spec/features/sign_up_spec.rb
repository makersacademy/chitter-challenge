# User Story 1
# As a Maker
# So that I can post messages on Chitter as me
# I want to sign up for Chitter

feature 'Signing up for a chitter account' do
  scenario 'The user can sign up, if their passwords match' do
    visit '/'
    click_button 'ENTER CHITTER'
    click_button 'sign me up'
    sign_up
    fill_in :password_confirmation, with: '1234'
    expect{ click_button 'register'}.to change(User, :count).by(1)
  end

  scenario 'they receive a welcome message' do
    visit '/'
    click_button 'ENTER CHITTER'
    click_button 'sign me up'
    sign_up
    fill_in :password_confirmation, with: '1234'
    click_button 'register'
    user = User.first
    expect(user.email).to eq 'Jessica@me.com'
    expect(page).to have_content 'Hi Jessica'
  end


  scenario 'The user cannot sign up, if their passwords don\'t match'do
     visit '/'
     click_button 'ENTER CHITTER'
     click_button 'sign me up'
     sign_up
     fill_in :password_confirmation, with: '1000'
     expect{ click_button 'register'}.not_to change(User, :count)
   end
end

def sign_up
  fill_in :first_name, with: 'Jessica'
  fill_in :second_name, with: 'Jones'
  fill_in :username, with: 'Hannako'
  fill_in :email, with: 'Jessica@me.com'
  fill_in :password, with: '1234'
end
