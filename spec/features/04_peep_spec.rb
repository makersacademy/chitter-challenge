# As a Maker
# So that I can let people know what I am doing
# I want to post a message (peep) to chitter

# As a maker
# So that I can see what others are saying
# I want to see all peeps in reverse chronological order

# As a maker
# So that I can better appreciate the context of a peep
# I want to see the time at which it was made

feature '04. Display and add peeps' do
  scenario 'a) add a new peep by typing a text' do
    user_signup
    add_new_post
    expect(page).to have_text("Lorem ipsum dolor sit amet, consectetur adipiscing elit.")
  end
end
