feature 'User is able to sign up' do
  scenario 'User signs up with email and password' do
    visit('/user/new')
    fill_in('email', with: 'a@gmail.com')
    fill_in('password', with: '1234')
    fill_in('password_confirmation', with: '1234')
    click_button("Submit")
    expect(current_path).to eq '/peeps'
    expect(page).to have_content("Welcome")
    expect(User.first.email).to eq('a@gmail.com')
  end
end
