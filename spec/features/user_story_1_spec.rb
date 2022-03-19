# As a Maker
# So that I can let people know what I am doing  
# I want to post a message (peep) to chitter

feature 'Posting a peep' do
  scenario 'User can add peep to chitter' do
    visit('/')
    click_link(text: 'New Peep', href: '/new_peep')
    fill_in(name: 'peep_text', with: 'This is a test peep.')
    click_button(id: 'submit', value: 'Add Peep')
    expect(page).to have_text('This is a test peep.')
  end
end
