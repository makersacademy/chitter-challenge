feature 'sign up' do
  scenario 'a user can sign up to chitter' do
    visit('/sign_up')
    fill_in('Email', with: 'jake@gmail.com')
    fill_in('password', with: 'password123')
    fill_in('name', with: 'Jake')
    fill_in('username', with: 'Jake')
    click_button('Submit')

    expect
  end
end
