

feature 'Homepage' do
  scenario 'A welcome message is displayed when visiting' do
    visit('/')
    expect(page).to have_content('Welcome to Chitter')
  end

  scenario 'The homepage has a "post" button for posting peeps' do
    visit('/')
    expect(page).to have_button('Post')
  end



end
