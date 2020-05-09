feature 'peeps appear in reverse choronologial order' do
  scenario 'the most current peep appears at the top of the list' do
    login
    add_peep('This is the first peep')
    add_peep('This is the second peep')
    add_peep('This is the third peep')
    expect(first('.peep')).to have_content 'This is the third peep'
  end
end
