feature 'Adding a new account' do
  scenario 'A user can sign up to Chitter' do
    visit('/signup')
    fill_in('forename', with: 'Lucy')
    fill_in('surname', with: 'Stringer')
    fill_in('username', with: 'stringiest')
    fill_in('email', with: 'lucyjstringer@gmail.com')
    fill_in('password', with: 'password123')
    click_button('Sign-up')

    expect(page).to have_content "What's on your mind?"
  end
end
