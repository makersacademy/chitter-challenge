feature 'Viewing peeps' do
  scenario 'A user can see peeps' do
    Peeps.create(peep: 'This is my last peep')
    Peeps.create(peep: 'I am bored')
    Peeps.create(peep: 'This is my first peep')
    
    visit('/chitter')

    expect(page).to have_content "This is my last peep"
    expect(page).to have_content "I am bored"
    expect(page).to have_content "This is my first peep"
  end
end