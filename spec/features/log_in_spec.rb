feature 'Log In' do

  scenario 'I can log in and then see my Username' do
    create_account
    sign_in
    expect(page).to have_content "Welcome, username !"
  end

end
