# As a maker
# So that I can see what others are saying  
# I want to see all peeps in reverse chronological order

feature "View all in reverse chronological order" do
  xscenario "The homescreen shows all peeps" do
    visit('/')
    fill_in 'message', with: "My first Peep"
    click_button 'submit'
    fill_in 'message', with: "My second Peep"
    click_button 'submit'
    expect(page).to have_content "My second Peep"
  end
end