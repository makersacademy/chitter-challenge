

feature "Sign in ability" do

  let!(:user) do
    User.create(email: 'j.kingharman@googlemail.com',
                password: 'fake',
                password_confirmation: 'fake',
                name: "jas",
                username: "j")
  end

  def sign_in(email:, password:)
    visit('/sessions/new')
    fill_in :email, with: email
    fill_in :password, with: password
    click_button('Sign in')
  end

  scenario 'with correct credentials' do
    sign_in(password: user.password, email: user.email)
    expect(page).to have_content "Welcome, #{user.email}"
  end

end
