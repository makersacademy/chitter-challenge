
feature 'homepage' do
  scenario 'user can post message to appear in Chitter feed' do
    visit('/')
    fill_in 'Message', with: 'Social media is to socializing what masturbating is to sex.'
    click_button 'post message'
    expect(page).to have_content('Social media is to socializing what masturbating is to sex.')
  end
end
