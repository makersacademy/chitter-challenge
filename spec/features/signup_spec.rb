feature 'User sign up' do
  scenario 'a user can sign up to Chitter' do
    visit '/users/new'
    fill_in('email', with: 'jess@test.com')
    fill_in('handle', with: 'jesstest')
    fill_in('password', with: 'abcdef')
    click_button('Sign up')

    expect(page).to have_content 'Welcome jesstest'
  end
end
