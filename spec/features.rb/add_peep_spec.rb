feature 'adding peeps' do
  scenario 'I want to be able to add a peep and see it on the page' do
    visit '/'
    fill_in 'peep', with: "THEY'RE TAKING THE HOBBITS TO ISENGARD"
    click_button 'Peep'
    expect(page).to have_content "THEY'RE TAKING THE HOBBITS TO ISENGARD"
  end

  scenario 'I want to see the time I posted it at' do
    allow(Time).to receive(:now).and_return(Time.new(2018,02,02,12,0,0,"+09:00"))
    visit '/'
    fill_in 'peep', with: "My PRECIOUS!"
    click_button 'Peep'
    expect(page).to have_content "12:00PM 2 Feb 18"
  end
end
