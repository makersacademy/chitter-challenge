feature 'Viewing Peeps' do
  scenario 'We can view peeps' do
    Chitterpeep.add_peep("My first Peep")
    visit('/peeps')
    expect(page).to have_content("My first Peep")
  end
end