# As a Maker
# So that I can let people know what I am doing
# I want to post a message (peep) to chitter

feature 'posting links' do
  scenario 'I can post a peep to Chitter' do
    Peep.create(body: 'My first peep!')
    visit('/')
    expect(page.status_code).to eq 200

    within 'ul#peeps' do
      expect(page).to have_content('My first peep!')
    end
  end
end
