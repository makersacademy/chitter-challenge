feature 'adding peeps' do
  scenario 'I want to be able to add a peep and see it on the page' do
    visit '/'
    fill_in 'peep', with: "THEY'RE TAKING THE HOBBITS TO ISENGARD"
    click_button 'Peep'
    expect(page).to have_content "THEY'RE TAKING THE HOBBITS TO ISENGARD"
  end
end
