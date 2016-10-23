
feature 'User can interact with peeps' do
  
  let!(:peep) do
    Peep.create(email: 'salvini@padania.com',
                title: 'I secretly love Italy',
                content: 'I can say it now, in a foreign language but not in my home country that is why I am dying inside')
  end

  scenario 'Anybody can see public peeps' do
    visit('/')
    expect(page).to have_content "I secretly love Italy"
    expect(page).to have_content "I can say it now"
  end



  let!(:user) do
    User.create(email: 'user@example.com',
                password: 'miao',
                password_confirmation: 'miao')
  end

  scenario 'with correct credentials' do
    sign_in(email: user.email,   password: user.password)
    expect(page).to have_content "Welcome, #{user.email}"
  end

  def sign_in(email:, password:)
    visit '/sessions/new'
    fill_in :email, with: email
    fill_in :password, with: password
    click_button 'Sign in'
  end

end
