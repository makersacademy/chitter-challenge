feature 'Adding hash tags' do

  scenario 'I can add a single hash tag to a new peep' do
    user = build :user
    sign_up(user)
    click_button 'Peep'
    fill_in 'message',   with: 'hi, it is saturday'
    fill_in 'tag',  with: 'day'
    click_button 'Post peep'
    peep = Peep.first
    expect(peep.tags.map(&:name)).to include 'day'
  end
end
