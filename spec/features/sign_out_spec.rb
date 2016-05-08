feature 'User signs out' do
  before (:each) do
    User.create(username: 'OMGDuke', name: 'Alex',
                email: 'name@email.com', password: '12345',
                password_confirmation: '12345')
  end

  scenario 'while being signed in' do
    sign_in(username: 'OMGDuke', password: '12345')
    click_button 'Sign out'
    expect(page).to have_content "Goodbye"
    expect(page).to_not have_content "Welcome, Alex"
  end
end
