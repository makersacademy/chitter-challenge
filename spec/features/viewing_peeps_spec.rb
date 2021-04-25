require 'pg'

feature 'Viewing all peeps' do
  scenario 'user visits homepage and see all peeps' do
    Peep.post(peep: 'Its a beautiful day')
    Peep.post(peep: 'Get vaccinated. Wear a mask. Save lives.')
    Peep.post(peep: 'Happy Earth day')
    
    visit '/home'

    expect(page).to have_content 'Its a beautiful day'
    expect(page).to have_content 'Get vaccinated. Wear a mask. Save lives.'
    expect(page).to have_content 'Happy Earth day'
  end
end
