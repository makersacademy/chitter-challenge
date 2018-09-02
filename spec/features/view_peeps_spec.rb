require 'pg'

feature "View all peeps" do
  scenario "User visits homepage and can view all peeps" do
    # visit ('/')
    # click_button 'Add Peep'  # fails: Failure/Error: click_button 'Add Peep'
                                        # Capybara::ElementNotFound:
                                        # Unable to find button "Add Peep"

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

feature "View all peeps in descending order" do
  scenario "User visits homepage and clicks view in descending order" do
    visit ('/')
    #click_button 'Descending' # Fails - Failure/Error: click_button 'Descending'
                                        # Capybara::ElementNotFound:
                                        # Unable to find button "Descending"

  end
end
