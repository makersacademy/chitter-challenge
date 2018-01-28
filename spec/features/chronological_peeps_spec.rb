feature 'chronological peeps' do
  scenario 'peeps appear in reverse chronological order' do
    add_peep('Is anybody out there?')
    add_peep('Nobody home')
    expect('Nobody home').to appear_before('Is anybody out there?')
  end
end
