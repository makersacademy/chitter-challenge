feature 'displays peeps' do
  scenario 'user can view peeps in reverse chronological order' do
    peep = Peep.create(peep: 'display this', time: 'Time.new(2000)')
    visit '/peeps'
    expect(page).to have_content('display this')
  end
end
