require './app/app'

RSpec.feature "Signing out", :type => :feature do
  include Helpers
  scenario "user signs out" do
    user = User.new(username: 'Miko', email: 'miko@o2.pl', password: 'gweatonidas326', password_confirmation: 'gweatonidas326')
    sign_up(user)
    sign_in(user)
    click_button('Log out')
    expect(current_path).to eq '/'
    message = "Good bye! We hope to see you again soon :)"
    expect(page).to have_content(message)
    welcome = "Welcome back, Miko!"
    expect(page).not_to have_content(welcome)
  end
end
