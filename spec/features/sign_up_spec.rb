require_relative 'web_helpers'

feature "Signing up" do
  scenario "Signing up for Chitter increases the user count by 1" do
    sign_up
    expect{sign_up}.to change{User.count}.by 1
  end
end
