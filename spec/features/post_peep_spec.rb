# As a Maker
# So that I can let people know what I am doing
# I want to post a message (peep) to chitter

feature 'Posting a peep' do
  include WebHelper
  before do
    visit '/post'
    post_peep
  end

  scenario 'create a peep' do
    expect(page).to have_content "Peep posted"
  end

  scenario 'see peeps' do
    click_button "View peeps"
    expect(page).to have_content "Hi there"
  end
end
