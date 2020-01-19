feature 'Viewing peep' do
  scenario 'A user can see peeps in reverse chronological order' do
    Peeps.post(message: 'This is a peep!')
    visit('/peeps')

    expect(current_path).to eq '/peeps'
    expect(page).to have_content "This is a peep!"
  end 
end
