# As a Maker
# So that I can let people know what I am doing
# I want to post a message (peep) to chitter

feature '04. Display and add peeps' do
  scenario 'a) add a new peep by typing a text' do
    user_signup
    add_new_post
    expect(page).to have_text("Lorem ipsum dolor sit amet, consectetur adipiscing elit.")
  end
end
