feature 'Showing all peeps on the feed' do
  scenario 'Peeps displayed on the feed' do

    visit('/')
    expect(page).to have_content 'Peep!'
  end
end
