feature 'login' do
  scenario 'I want to log in' do
    visit('/users/login')
    fill_in('email', with: 'mail@mail.com')
    fill_in('password', with: 'password')
    click_button('Login')

    expect(page).to have_content('mail@mail.com')

    within 'ul#homepage' do
    expect(page).to have_content('hello')
    end
  end
end
