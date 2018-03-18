feature 'Login page has jumbotron' do
  scenario 'User visits login main page' do
    visit('/')
    expect(page).to have_content "ChitterBox"
    expect(page).to have_content "Responsive chat app using using bootstrap, sinatra and Postgres for DB."
  end
end

feature 'Login page has main h1' do
  scenario 'User visits login main page' do
    visit('/')
    expect(page).to have_content "Please log in"
  end
end

feature 'Login page takes to /peeps after login' do
  scenario 'User visits login page and successfully logs in' do
    visit('/')
    fill_in('txt_username', with: 'johndoe')
    fill_in('txt_pwd', with: 'johndoe')
    click_on('btn_login')
    expect(page).to have_field("tb_peep")
    expect(page).to have_button("btn_peep")
  end
end

feature 'Login gets error message at login' do
  scenario 'User gets error message for inputing wrong login details' do
    visit('/')
    fill_in('txt_username', with: 'wrong_user_name')
    fill_in('txt_pwd', with: 'or_wrong_password')
    click_on('btn_login')
    expect(page).to have_content("Invalid username or password")
    expect(page).not_to have_field("tb_peep")
    expect(page).not_to have_button("btn_peep")
  end
end
