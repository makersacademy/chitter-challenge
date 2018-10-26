# As a Maker
# So that I can post messages on Chitter as me
# I want to sign up for Chitter

feature 'Adding Peep' do
  scenario 'a user can add a peep' do
    visit('/')
    click_button('Post a Peep')
    fill_in :peep, with: 'Woohoo, I am peeping'
    click_button('Peep')
    # p URI.parse(current_url)
    expect(page).to have_content('Peep: Woohoo, I am peeping')
  end
end
