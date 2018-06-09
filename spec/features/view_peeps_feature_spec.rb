# User Story 2
# As a maker
# So that I can see what others are saying
# I want to see all peeps in reverse chronological order
feature 'Viewing peeps' do
  scenario 'see all peeps in reverse chronological order' do
    visit '/'
    fill_in('peep', with: "This peep is very profound")
    click_button('Post')
    click_button('Write another peep')
    fill_in('peep', with: "This one is not, it is just a cat GIF")
    click_button('Post')
    expect("This one is not, it is just a cat GIF").to appear_before("This peep is very profound")
  end
end

# User Story 3
# As a Maker
# So that I can better appreciate the context of a peep
# I want to see the time at which it was made
