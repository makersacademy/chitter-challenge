feature 'Peeps' do
  before(:each) do
    user = User.create(username: "troi99",
                email: "dtroi@starfleet.com",
                name: "Deanna Troi",
                password: "imzadi",
                password_confirmation: "imzadi")
    sign_in(username: user.username, password: user.password)
  end

  scenario 'user posts peep' do
    click_button 'Write peep'
    fill_in :peep, with: 'Enterprise crew safe.  #crashlanding'
    click_button 'Post peep'
    expect(page).to have_content 'Enterprise crew safe.  #crashlanding'
  end

  def sign_in(username:, password:)
    visit '/sessions/new'
    fill_in :username, with: "troi99"
    fill_in :password, with: "imzadi"
    click_button 'Sign in'
  end
end
