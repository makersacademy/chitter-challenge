
RSpec.feature 'Sign up page' do
  scenario 'It allows users to sign up on chitter' do
    visit('/user/new')
    fill_in('name', with: 'Sarpong')
    fill_in('lastname', with: 'Abasimi')
    fill_in('email', with: 'sarps@demo.com')
    fill_in('password', with: 'demo123')
    fill_in('confirm_password', with: 'demo123')
    click_on('submit')
    expect(page).to have_content('')
  end
end
