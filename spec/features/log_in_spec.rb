feature "Log In" do

  def log_in(email:, password:)
    visit '/sessions/new'
    fill_in :email, with: email
    fill_in :password, with: password
    click_button 'Log In'
  end

  let!(:user) do 
    User.create(email: '92jackhenderson@gmail.com',
                password: 'secret1234',
                password_confirmation: 'secret1234',
                name: 'Jack Henderson',
                user_name: 'art_ful_gar_funk')
  end

  scenario 'with correct credentials' do
    log_in(email: user.email, password: user.password)
    expect(page).to have_content "Welcome, #{user.email}!"
  end


end
