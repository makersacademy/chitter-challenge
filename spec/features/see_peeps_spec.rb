# As a Maker
# So that I can see what is going on on chitter
# I want to see all peeps on chitter

feature 'Viewing peeps' do
  before do
    visit '/post'
    fill_in 'peep', with: "Hi there"
    click_button "Peep"
    visit '/'
    click_button "View peeps"
  end

  scenario 'see peeps on chitter' do
    expect(page).to have_content "Chitter"
    expect(page).to have_content "Hi there"
  end
end

# As a Maker
# So that I can better appreciate the context of a peep
# I want to see the time at which it was made
