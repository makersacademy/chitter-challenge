feature 'sign up page' do

  scenario 'user is greeted by a sign up page when visiting /signup' do
    visit '/signup'
    expect(page).to have_content 'Sign up for Chitter'
  end

  scenario 'User can sign up' do
    visit '/signup'
    fill_in('email', with: 'test@example.com')
    fill_in('username', with: 'tester')
    fill_in('name', with: 'John Doe')
    fill_in('password', with: 'hunter123')
    fill_in('password_confirm', with: 'hunter123')
    click_button('Sign up')
    expect(page).to have_content 'Welcome, John Doe'
  end
end
