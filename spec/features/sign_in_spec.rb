feature 'User signs in' do
  let!(:user) do
    User.create(username: "troi99",
                email: "dtroi@starfleet.com",
                name: "Deanna Troi",
                password: "imzadi",
                password_confirmation: "imzadi")
  end

  scenario 'with correct credentials' do
    sign_in(username: user.username, password: user.password)
    expect(page).to have_content "Welcome to Chitter, #{user.name}."
  end

  def sign_in(username:, password:)
    visit '/sessions/new'
    fill_in :username, with: "troi99"
    fill_in :password, with: "imzadi"
    click_button 'Sign in'
  end
end
