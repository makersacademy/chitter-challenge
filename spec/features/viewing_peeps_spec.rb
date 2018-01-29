feature 'Viewing peeps' do

  scenario 'The user can see a list of peeps on the peeps page' do
    Peep.create(message: "Peep peep")
    visit '/peep/all'
    expect(page.status_code).to eq 200
    expect(page).to have_content("Peep peep")
  end

  scenario 'The tweets are displayed in reverse chronological order' do
    visit '/peep/new'
    fill_in 'message', with: 'I love Chitter!'
    click_button 'Submit'
    visit '/peep/new'
    fill_in 'message', with: 'What a lovely site!'
    click_button 'Submit'
    expect("What a lovely site!").to appear_before("I love Chitter!")
  end

end
