require './app/app'

RSpec.feature "New message", :type => :feature do
  include Helpers
  scenario "user submits a new message" do
    user = User.new(username: 'Miko', email: 'miko@o2.pl', password: 'gweatonidas326', password_confirmation: 'gweatonidas326')
    sign_up(user)
    sign_in(user)
    post_message("Hello world!")
    expect(current_path).to eq '/dashboard'
    message = "Your message has been posted."
    expect(page).to have_content(message)
    expect(Message.first.content). to eq "Hello world!"
  end
end
