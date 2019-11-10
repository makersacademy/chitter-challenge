feature "Login page/sign up" do

  scenario 'displays chitter title' do
    visit '/'
    expect(page).to have_text("Chitter")
  end

  scenario 'creating account' do
    visit '/'
    click_on 'Sign Up!'
    fill_in "email", with: 'eddy@gmail.com'
    fill_in "password", with: '1234'
    fill_in "name", with: 'Eddy'
    click_on "Create account"
    expect(page).to have_text("Account created successfully!")
  end

end
