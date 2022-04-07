feature 'registration' do
  scenario 'a user can sign up' do
    visit '/users/new'
    fill_in('email', with: 'test@example.com')
    fill_in('password', with: 'pasword123')
    fill_in('name', with: 'Valentina')
    fill_in('username', with: 'ValentinaM')
    click_button('Register')

    expect(page).to have_content 'Welcome to Chitter, Valentina!'
  end
end
