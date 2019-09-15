feature "visiting page" do
  scenario 'Ask user to register or login' do
    visit '/'
    fill_in "Email", with: 'user@name.com'
    fill_in "Password", with: '1234576'
    click_on 'Login'
    expect(current_path).to eql('/')
    click_on 'Sign Up'
    expect(current_path).to eql('/register')
  end
end
