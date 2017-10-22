feature 'User sign in' do

  let!(:maker) do
    Maker.create(name: 'Zara',
                username: 'Zara02',
                email: 'maker@example.com',
                password: 'yorkshire1234',
                password_confirmation: 'yorkshire1234')
  end

  scenario 'with correct credentials' do
    sign_in(name: maker.name, username: maker.username, email: maker.email, password: maker.password)
    expect(page).to have_content "Welcome, #{maker.username}"
  end

  def sign_in(name:, username:, email:, password:)
    visit '/sessions/new'
    fill_in :name, with: name
    fill_in :username, with: username
    fill_in :email, with: email
    fill_in :password, with: password
    click_button 'Sign in'
  end

end
