# As a Maker
# So that I can see what is going on on chitter
# I want to see all peeps on chitter

feature 'Viewing peeps' do
  before do
    visit '/post'
    post_peep
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

feature 'Viewing the time that a peep was posted' do

  before do
    visit '/post'
    post_peep
    visit '/'
    click_button "View peeps"
  end

  scenario 'When viewing peeps' do
    expect(page).to have_content "Peep was posted at: "
  end
end
