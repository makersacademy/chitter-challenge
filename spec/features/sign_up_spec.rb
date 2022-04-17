feature 'Signing up' do
  scenario 'a user can sign up' do
    visit '/sign_up'
    fill_in('username', with: 'Josenewmano')
    fill_in('name', with: 'Joseph Newman')
    fill_in('email', with: 'definitelyarealemail@email.com')
    fill_in('password', with: 'reallygoodpassword')
    click_button('Join Chitter')

    expect(page).to have_content 'Welcome back to Chitter Josenewmano!'
  end
  scenario 'a user cannot sign up when the username is already taken' do
    User.create(username: 'Josenewmano', name: 'Reg Dennis', email: 'a@b.com', password: 'abc')
    visit '/sign_up'
    fill_in('username', with: 'Josenewmano')
    fill_in('name', with: 'Joseph Newman')
    fill_in('email', with: 'definitelyarealemail@email.com')
    fill_in('password', with: 'reallygoodpassword')
    click_button('Join Chitter')

    expect(page).to have_content 'Sorry, some of your choices are already in use by other Chitter family members.'
    expect(page).to have_button 'Try again?'
  end
  scenario 'a user cannot sign up when the email is already taken' do
    User.create(username: 'BigD', name: 'Reg Dennis', email: 'definitelyarealemail@email.com', password: 'abc')
    visit '/sign_up'
    fill_in('username', with: 'Josenewmano')
    fill_in('name', with: 'Joseph Newman')
    fill_in('email', with: 'definitelyarealemail@email.com')
    fill_in('password', with: 'reallygoodpassword')
    click_button('Join Chitter')

    expect(page).to have_content 'Sorry, some of your choices are already in use by other Chitter family members.'
    expect(page).to have_button 'Try again?'
  end
end
