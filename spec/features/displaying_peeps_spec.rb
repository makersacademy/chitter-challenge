require 'timecop'

feature 'Displaying peeps' do
  scenario 'user posts a peep which is displayed' do
    Peep.create(peep: 'This is a peep')
    Peep.create(peep: 'This is another peep')
    visit '/peeps'
    expect(page).to have_content 'This is a peep'
    expect(page).to have_content 'This is another peep'
  end
end