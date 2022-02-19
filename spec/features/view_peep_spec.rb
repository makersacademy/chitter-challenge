feature 'Viewing Peeps' do
  scenario 'We can view peeps' do
    visit('/peeps')
    expect(page).to have_content("My first Peep")
  end
end