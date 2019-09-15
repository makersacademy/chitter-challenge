feature 'resgister' do
  scenario 'If user is not register yet' do
    visit '/register'
    fill_in "Name", with: 'name'
    fill_in "Last Name", with: 'last_name'
    fill_in "Email", with: 'user_email'
    fill_in "Password", with: 'password'
    click_on 'Submit'
    expect(current_path).to eql('/register')
  end
end
