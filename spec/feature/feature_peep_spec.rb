feature 'Show messages(peeps)' do
  scenario 'shows messages sent by users' do
    Peep.create(message: 'Hello everyone on Chitter')
    Peep.create(message: 'How is everyone doing?')
    visit('/peeps')
    expect(page).to have_content "Hello everyone on Chitter"
    expect(page).to have_content "How is everyone doing?"
  end
end
