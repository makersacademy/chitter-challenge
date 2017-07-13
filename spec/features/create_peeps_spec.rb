feature 'Creating peeps' do
  scenario 'I can add a peep to chitter' do
    sign_in
    Peep.create(content: 'This is my first peep!')
    visit('/peeps')
    expect(page).to have_content 'Chitter'
    within 'ul#peeps' do
      expect(page).to have_content 'This is my first peep!'
    end
  end
end
