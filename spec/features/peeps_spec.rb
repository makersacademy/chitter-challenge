feature 'Displaying peeps' do
  scenario 'A user can see all peeps in reverse chronological order' do
    peeps = ['I am coding and testing Chitter challenge',
             'I am going out for a walk',
             'I am reading POODR',
             'I am meditating']
    peeps.length.times { |i| Peep.create(text: peeps[i]) }
    peek_at_peeps
    expect(page).to have_content peeps.reverse.join("\n")
  end
end
