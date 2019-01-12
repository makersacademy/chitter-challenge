feature 'Displaying Peeps' do
  scenario 'A user can see a peep' do
    post_peep
    expect(page).to have_content 'Test peep'
  end
end
