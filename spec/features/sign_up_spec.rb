require 'helpers'

feature "#Sign-up page" do
  include Helpers

  scenario 'User to complete email and password and submit' do
    sign_up
    expect(page).to have_content("Welcome, cleo@email.com")
  end
end


# #{user.email}
