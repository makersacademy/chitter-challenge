# As a Maker
# So that I can let people know what I am doing
# I want to post a message (peep) to chitter
feature 'posting peeps' do
  scenario 'a authenticated user can post peeps on chitter' do
    visit('/peeps/new')
    fill_in("new_peep", with: 'First peep')
    click_button('Peep away')
    expect(page).to have_content('First peep')
  end
end
