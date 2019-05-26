feature 'Viewing peeps' do
  scenario 'visiting the index page' do
    visit '/peeps'

    expect(page).to have_content("CHITTER")
  end

  scenario 'user can view peeps' do    
    Peep.send(message: "First peep")
    Peep.send(message: "Second peep")
    Peep.send(message: "Third peep")

    visit '/peeps'

    expect(page).to have_content("Third peep")
    expect(page).to have_content("Second peep")
    expect(page).to have_content("First peep")
  end
end
