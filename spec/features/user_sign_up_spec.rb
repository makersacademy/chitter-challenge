feature 'sign up' do
  scenario 'user can sign up for Chitter' do
    visit('/chitter')
    click_button('Sign up to Chitter')
    fill_in('name', with: 'Amy Jordan')
    fill_in('email', with: 'amy@testemail.com')
    fill_in('username', with: 'amy123')
    fill_in('password', with: 'password')
    click_button('Start peeping')

    expect(page).to have_content('Welcome to Chitter, amy123')
  end
end
