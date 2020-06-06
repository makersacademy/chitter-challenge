require_relative './web_helper.rb'

feature 'has an opening browser page' do
  it 'Says welcome to Chitter on the home page' do
    visit('/')
    expect(page).to have_content('Welcome to Chitter')
  end

  it 'Has a button a field to create a new peep' do
    visit('/')
    expect(page).to have_field('new_peep')
  end
end

feature 'Peep' do
  it 'Shows all peeps in reverse chronological order' do
    fill_db
    expect(page).to have_content('This is my first peep')
    expect(page).to have_content('tis but a peep')
    expect(page).to have_content('no body expects the spanish inquisition')
  end
end
