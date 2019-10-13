feature 'show peeps' do
  scenario 'show peeps in reverse chronological order' do
    add_test_peeps(5)
    visit '/home'

    expect(first('.peep')).to have_content "Test peep 5"
  end
end