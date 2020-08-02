feature 'A stream of peeps can be viewed' do
  scenario 'A user views a stream of peeps' do
    visit '/peeps'
    expect(page).to have_content("Your peep stream:")
  end
end
