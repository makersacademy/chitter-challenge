require_relative './web_helpers.rb'

feature "can post a peep" do
  scenario "can submit a peep" do
    visit("/")
    fill_in 'new_peep', with: "This is a post."
    click_button 'Submit'
    expect(page).to have_content("This is a post.")
  end
end

feature "can view peeps" do
  scenario "in reverse chronological order" do
    submit_peep
    fill_in 'new_peep', with: "This is another post."
    click_button 'Submit'

    top_peep = first(".peep_body")
    expect(top_peep).to have_content("This is another post.")
  end
end 
