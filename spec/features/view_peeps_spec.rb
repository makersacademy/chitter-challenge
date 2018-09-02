require 'pg'

feature "View all peeps" do
  scenario "User visits homepage and can view all peeps" do
    visit '/add_new_peep'
    # Set up peeps
    Peep.create_new_peep(content: "I''m a newbie, and this is my first peep!")
    Peep.create_new_peep(content: "My second peep, I think I like it!")
    Peep.create_new_peep(content: "I can''t stop peeping, I think I''m addicted!")
    # go to the peeps page and check peeps exist
    visit ('/')
    expect(page).to have_content("I'm a newbie, and this is my first peep!")
    expect(page).to have_content("My second peep, I think I like it!")
    expect(page).to have_content("I can't stop peeping, I think I'm addicted!")
  end
end
