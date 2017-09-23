feature 'When creating peeps' do

  scenario 'I can see my new peeps on the peeps page' do

    visit '/peeps'
    fill_in :peep_body, with: "I'm creeping and I'm peeping"
    click_button 'Peep'
    expect(page).to have_content("I'm creeping and I'm peeping")





  end

end
