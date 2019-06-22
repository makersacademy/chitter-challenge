feature 'View Peeps' do
  scenario 'Users can view all peeps' do
    expect(page).to have_content "This is my second peep"
  end
end
