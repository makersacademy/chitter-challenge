feature 'Adding a peep' do

  scenario 'Adding a peep shows it on the home page' do
    visit('/')
    fill_in('content', with: "peep peep, I'm in me mum's car")
    click_button('Share')
    expect(page).to have_content("peep peep, I'm in me mum's car")
  end

end
