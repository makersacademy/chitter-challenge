feature 'who peeped' do
  scenario 'shows the name of the user who made the peep' do
    login
    add_peep('This is a peep')
    expect(first('.peep')).to have_content 'fakeuser'
  end
end
