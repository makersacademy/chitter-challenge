feature 'View Peeps' do
  scenario 'Users can view all peeps' do
    visit '/'
    expect(page).to have_content "This is my second peep"
  end
end
