feature 'Sign up' do
  scenario 'You sign up' do
    visit('/sign-up')
    fill_in 'username', with: 'EllieM'
    fill_in 'email', with: 'makersemail@gmail.com'
    fill_in 'password', with: 'PASSWORD123'
    click_on 'submit'
    expect(page).to have_content 'Hello EllieM, what would you like to do?'
  end
end
