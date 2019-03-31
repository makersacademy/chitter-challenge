feature 'peeps in reverse chronological order' do
  scenario 'all peeps are presented in reverse chronological order' do
    Peep.create(content: 'This is the first peep')
    sleep(0.5)
    Peep.create(content: 'This is the second peep')
    visit('/chitter')
    expect(page).to have_content('This is the second peep This is the first peep')
  end
end
