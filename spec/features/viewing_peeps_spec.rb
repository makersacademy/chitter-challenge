# As a maker
# So that I can see what others are saying  
# I want to see all peeps in reverse chronological order

feature "Viewing peeps" do
  scenario "user can see list of peeps" do
    visit "/peeps"
    expect(page).to have_selector "ul"
  end

  scenario "user can see detail of peeps" do
    visit "/peeps"
    expect(page).to have_content "My very first peep, people!"
  end
end