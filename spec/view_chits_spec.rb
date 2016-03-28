feature 'View chits' do
  scenario 'I would like to view other peoples tweets' do
    sign_up
    sign_in
    add_chit('This is my first tweet','hello')
    visit '/chits'
    expect(page.status_code).to eq 200
    within 'ul#chits' do
      expect(page).to have_content('This is my first tweet')
    end
  end

end
