feature 'Sign out' do

  before(:each) do
    User.create(email: 'test@test.com',
                password: 'test',
                full_name: 'Testy McTestface',
                username: 'tester4lyf')
  end

  scenario 'while being signed in' do
    sign_in(email: 'test@test.com', password: 'test')
    click_button 'Sign out'
    expect(page).to have_content("See you soon!")
    expect(page).not_to have_content('Testy McTestface')
  end

end
