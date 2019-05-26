feature 'peeps appear in reverse order' do
  scenario 'the most recent peeps appear at the top of the wall' do
    visit('/')
    fill_in 'peep', with: "peep1"
    click_button 'Submit Peep'
    fill_in 'peep', with: "Peep2"
    click_button 'Submit Peep'
    peeps = Peep.all(:order => [ :creation_time.desc ])
    expect(peeps[0].content).to eq("Peep2")

  end
end
