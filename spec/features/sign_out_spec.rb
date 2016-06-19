feature 'User signs out' do

  before(:each) do
    User.create(username: 'toby123',
                name: 'Toby m-l',
                email: 'toby@example.com',
                password: 'secret1234',
                password_confirmation: 'secret1234')
  end

  scenario 'while being signed in' do
    sign_in(email: 'toby@example.com', password: 'secret1234')
    click_button 'Sign out!'
    expect(page).to have_content('Goodbye!')
    expect(page).not_to have_content('toby123')
  end

end
