feature "User log out" do

  let!(:user) do
    User.create(username: 'mrmurtz',
                email: 'murtz@gmail.com',
                password:  '1234',
                password_confirmation: '1234')
  end

  scenario 'I can log out' do
    log_in
    click_button 'Log out'
    expect(page).to have_content "See you again soon"
  end
end
