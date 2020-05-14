feature 'peep order' do
  scenario 'peeps appear in reverse chronological order' do
    login
    add_peep('This is the first peep')
    add_peep('This is the second peep')
    add_peep('This is the third peep')
    expect(first('.peep')).to have_content 'This is the third peep'
  end
end
