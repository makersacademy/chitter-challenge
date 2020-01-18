feature 'Viewing peep' do
  scenario 'A user can see the peeps they posted' do
    Peeps.post(message: 'This is a peep!')
    visit('/peeps')

    expect(page).to have_content "This is a peep!"
  end 
end
