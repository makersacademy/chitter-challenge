# User Story 2
# As a maker
# So that I can see what others are saying
# I want to see all peeps in reverse chronological order

# User Story 3
# As a Maker
# So that I can better appreciate the context of a peep
# I want to see the time at which it was made

feature 'Viewing peeps' do

  scenario 'see all peeps in reverse chronological order' do
    visit '/'
    fill_in('peep', with: "this is my first peep")
    click_button('Post')
    click_button('Post agagin')
    fill_in('peep', with: "this is my second peep")
    click_button('Post')
    expect("this is my first peep").to appear_before("this is my second peep")
  end

  scenario 'see the time that the peeps were posted at' do
    visit '/'
    fill_in('peep', with: "this is my second peep")
    click_button('Post')
    expect(page).to have_content("time posted: ")
  end
end
