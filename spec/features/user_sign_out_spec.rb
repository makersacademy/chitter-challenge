feature 'user sign out' do
  before (:each) do
    User.create(name: 'Ivan Sathianathan', username: 'ivan', email: 'ivan@test.com', password: '12345', password_confirmation: '12345')
  end

  scenario "while being signed in" do
    sign_in(username: 'ivan', password: '12345')
    click_button('Sign out')
    expect(page).to have_content 'Goodbye'
    expect(page).not_to have_content 'Welcome, Ivan Sathianathan'
  end
end
