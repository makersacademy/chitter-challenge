feature 'register' do
  scenario 'user registers for chitter' do
    visit('/register')
    expect(page).to have_content "Create a new Chitter account!"
    fill_in(:username, with: "JCash")
    fill_in(:password, with: 12345)
    fill_in(:first_name, with: "Johnny")
    fill_in(:last_name, with: "Cash")
    fill_in(:email, with: "JCash@gmail.com")
    click_on('Register')
  end
end
