feature 'login' do
  scenario 'user logs in to chitter' do
    visit('/user')
    expect(page).to have_content "Welcome to Chitter"
    fill_in(:username, with: "JCash")
    fill_in(:password, with: 12345)
    click_on('Submit')
  end
end

feature 'register' do
  scenario 'user registers for chitter' do
    visit('/user')
    expect(page).to have_content "Welcome to Chitter"
    fill_in(:username, with: "JCash")
    fill_in(:password, with: 12345)
    fill_in(:first_name, with: "Johnny")
    fill_in(:last_name, with: "Cash")
    fill_in(:email, with: "JCash@gmail.com")
    click_on('Submit')
  end
end
