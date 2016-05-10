def sign_in
  visit '/sessions/new'
  fill_in :email, with: 'valid@email.com'
  fill_in :password, with: 'password123'
  click_button 'Sign in'
end

feature 'User sign in' do 
  scenario 'User can sign in' do 
    sign_in
    expect {sign_in}.not_to change(User, :count)
    expect(page).to have_content('Please sign in!')
  end
end

