require './app/app'

RSpec.feature "Viewing all messages", :type => :feature do
  include Helpers
  scenario "user wamts to see all messages" do
    user = User.new(username: 'Miko', email: 'miko@o2.pl', password: 'gweatonidas326', password_confirmation: 'gweatonidas326')
    sign_up(user)
    sign_in(user)
    post_message("Hello world!")

    user2 = User.new(username: 'Pea', email: 'pea@wp.pl', password: 'podplomyczki13', password_confirmation: 'podplomyczki13')
    sign_up(user2)
    sign_in(user2)
    post_message("Rypki so najlepsze!")

    click_button("See all chirps!")
    expect(current_path).to eq '/messages/all'
    message = "Hello world!"
    message_two = "Rypki so najlepsze!"
    expect(page).to have_content(message)
    expect(page).to have_content(message_two)
  end
end
