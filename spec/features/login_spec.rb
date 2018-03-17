feature 'Login page has jumbotron' do
  scenario 'User visits login main page' do
    visit('/')
    expect(page).to have_content "ChitterBox"
    expect(page).to have_content "Responsive chat app using using bootstrap, sinatra and Postgres for DB."
  end
end

feature 'Login page takes to /peeps after login' do
  scenario 'User visits login page and successfully logs in' do
    visit('/')
    fill_in('txt_username', with: 'username')
    fill_in('txt_pwd', with: 'password')
    click_on('btn_login')
    expect(page).to have_field("tb_beep")
    expect(page).to have_button("btn_peep")
  end
end
