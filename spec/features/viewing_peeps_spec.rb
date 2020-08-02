feature 'Viewing peeps' do
  scenario 'user wants to see peeps in reverse chronological order' do
    User.create(
      username: 'FirstAuthor',
      email: 'test@makers.com',
      password: '12345'
    )
    Peep.create(text: 'First test peep', user_id: '1')
    Peep.create(text: 'Second test peep', user_id: '1')
    visit('/peeps')
    
    expect(page).to have_content('First test peep')
    expect(page).to have_content('Second test peep')
    expect(first('.peep')).to have_content 'Second test peep'
  end

  scenario 'user wants to see time peep was posted' do
    User.create(
      username: 'FirstAuthor',
      email: 'test@makers.com',
      password: '12345'
    )
    peep = Peep.create(text: 'First test peep', user_id: '1')
    visit('/peeps')

    expect(page).to have_content(peep.timestamp[0, 16])
  end

  scenario 'user wants to see author of peep' do
    User.create(
      username: 'FirstAuthor',
      email: 'test@makers.com',
      password: '12345'
    )
    Peep.create(
      text: 'First test peep', 
      user_id: '1'
      )
    visit('/peeps')

    expect(page).to have_content('FirstAuthor')
  end
end
