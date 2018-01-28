require 'helpers'

feature "Sign-up page --" do
  include Helpers

  scenario 'User to complete email and password and submit' do
    sign_up
    expect(page).to have_content("Welcome, CleoP")
  end

  scenario 'User count to increase by 1' do
    sign_up
    expect(User.count).to eq 1
  end
end
