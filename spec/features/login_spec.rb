feature "User log in" do
  before do
    sign_up(email: 'pug@gmail.com', name: 'Pug', username: '@puggy',
     password: 'password', password_confirmation: 'password')
  end

  scenario 'with correct credentials' do
    log_in(email: 'pug@gmail.com', password: 'password')
    expect(page).to have_content "Welcome pug@gmail.com"
  end
end
