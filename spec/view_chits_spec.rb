feature 'View chits' do
  scenario 'I would like to view other peoples tweets' do
    Chit.create(post: 'This is my first tweet', time: '19:40')
    visit '/chits'
    expect(page.status_code).to eq 200
    within 'ul#chits' do
      expect(page).to have_content('This is my first tweet')
    end
  end

end
