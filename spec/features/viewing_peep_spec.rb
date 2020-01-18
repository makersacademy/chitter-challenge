feature 'Viewing peep' do
  scenario 'A user can see the peeps they posted' do
    visit('/peeps')

    expect(page).to have_content "This is a peep!"
  end 
end
