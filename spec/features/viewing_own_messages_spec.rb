require './app/app'

RSpec.feature "Vewing own messages", :type => :feature do
  include Helpers
  scenario "user wants to see their chirps" do
    user = User.new(username: 'Miko', email: 'miko@o2.pl', password: 'gweatonidas326', password_confirmation: 'gweatonidas326')
    sign_up(user)
    sign_in(user)
    post_message("Hello world!")
    click_button("See your chirps!")
    expect(current_path).to eq '/messages/Miko'
    message = "Hello world!"
    expect(page).to have_content(message)
  end
end
