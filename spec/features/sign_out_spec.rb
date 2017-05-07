feature 'User signs out' do
  before(:each) do
    User.create(username: "troi99",
                email: "dtroi@starfleet.com",
                name: "Deanna Troi",
                password: "imzadi",
                password_confirmation: "imzadi")
  end

  scenario 'while being signed in' do
    sign_in(username: "troi99", password: "imzadi")
    click_button 'Sign out'
    expect(page).to have_content('Goodbye!')
    expect(page).not_to have_content('Welcome, Deanna!')
  end

  def sign_in(username:, password:)
    visit '/sessions/new'
    fill_in :username, with: "troi99"
    fill_in :password, with: "imzadi"
    click_button 'Sign in'
  end
end
