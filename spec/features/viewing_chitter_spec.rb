feature 'Viewing chitter' do
  scenario 'a user can see peeps' do
    Peep.create(text: 'This is Peep 1')
    Peep.create(text: 'This is Peep 2')
    visit('/peeps')
    expect(page).to have_content "This is Peep 1"
    expect(page).to have_content "This is Peep 2"
  end
end
