feature 'Viewing sting peeps' do
  scenario 'User can view peeps in reverse chronological order' do
    visit('/chitter')
    click_button('New Peep')

    expect(current_path).to eq '/chitter/peep/new'

    fill_in :peep, with: "Old peep"
    click_button "Post Peep"
    click_button('New Peep')
    fill_in :peep, with: "New peep"
    click_button "Post Peep"

    expect("New peep").to appear_before "Old peep"
  end
end