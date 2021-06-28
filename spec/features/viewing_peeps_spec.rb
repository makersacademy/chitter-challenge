feature 'Viewing peeps' do
  scenario 'A user can see peeps' do

    Peep.create(peep: "Hello weekend!")
    Peep.create(peep: "I love Chitter!")
    Peep.create(peep: "Good Bye COVID-19!")

    visit('/peeps')

    expect(page).to have_content 'Hello weekend!'
    expect(page).to have_content 'I love Chitter!'
    expect(page).to have_content 'Good Bye COVID-19!'
  end  
end
