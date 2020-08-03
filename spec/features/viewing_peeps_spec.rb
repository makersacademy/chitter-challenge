require 'database_helpers'

feature 'Viewing peeps' do
  scenario 'user wants to see peeps in reverse chronological order' do
    user = create_user
    Peep.create(text: 'First test peep', user_id: user.id)
    Peep.create(text: 'Second test peep', user_id: user.id)
    visit('/peeps')
    
    expect(page).to have_content('First test peep')
    expect(page).to have_content('Second test peep')
    expect(first('.peep')).to have_content 'Second test peep'
  end

  scenario 'user wants to see time peep was posted' do
    user = create_user
    peep = Peep.create(text: 'First test peep', user_id: user.id)
    visit('/peeps')

    expect(page).to have_content(peep.timestamp[0, 16])
  end

  scenario 'user wants to see author of peep' do
    user = create_user
    Peep.create(text: 'First test peep', user_id: user.id)
    visit('/peeps')

    expect(page).to have_content('FirstAuthor')
  end
end
