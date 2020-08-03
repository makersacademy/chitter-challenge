require 'web_helpers'

feature 'Posting a peep' do
  scenario 'view posted peep' do
    register_user
    visit('/peeps/new')
    fill_in('text', with: "New peep text")
    click_button('Post your Peep!')

    expect(page).to have_content("New peep text")
  end
end
