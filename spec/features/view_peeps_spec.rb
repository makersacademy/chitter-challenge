feature 'view peeps' do

  scenario 'view peeps' do
    Peep.create(description: 'test information')
    visit('/')
    expect(page).to have_content('test information')
  end

  scenario 'view peeps in reverse chronological order' do
  end

end
