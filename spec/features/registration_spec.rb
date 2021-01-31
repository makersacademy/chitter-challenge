feature 'registration' do
  scenario 'a user can sign up' do
    visit '/'
    click_button('Sign up')

    fill_in('name', with: 'Bob the Builder')
    fill_in('username', with: 'BBuilder')
    fill_in('email', with: 'bob@builder.com')
    fill_in('password', with: 'Shovel')
    click_button('Create account')

    expect(page).to have_content "Welcome to Chitter"
  end
end
