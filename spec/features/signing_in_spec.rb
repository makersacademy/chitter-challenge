require './app/app'

RSpec.feature "Signing in", :type => :feature do
  include Helpers
  scenario "user signs in" do
    user = User.new(username: 'Miko', email: 'miko@o2.pl', password: 'gweatonidas326', password_confirmation: 'gweatonidas326')
    sign_up(user)
    sign_in(user)
    expect(current_path).to eq '/dashboard'
    message = "Welcome back, Miko!"
    expect(page).to have_content(message)
  end
end
