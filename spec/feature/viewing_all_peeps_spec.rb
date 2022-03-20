feature 'Viewing all peeps' do
  scenario 'A user can see peeps' do
    
    Peep.create(peep: 'This is my first peep!', user_id: 10)
    Peep.create(peep: 'This is my second peep!', user_id: 10)
    
    visit('/peeps')

    expect(page).to have_content('This is my first peep!')
    expect(page).to have_content('This is my second peep!')
  end
end
