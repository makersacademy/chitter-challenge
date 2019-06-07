
feature 'homepage' do
  scenario 'user can post message to appear in Chitter feed' do
    visit('/')
    fill_in 'message', with: 'Social media is to socializing what masturbating is to sex.'
    click_button 'post'
    expect(page).to have_content('Social media is to socializing what masturbating is to sex.')
  end

  scenario 'previous cheeps should appear in reverse chronological order' do
    visit('/')
    fill_in 'message', with: 'message1'
    click_button 'post'
    expect(page).to have_tag("ul:last-child", :text => "message1")
    fill_in 'message', with: 'message2'
    click_button 'post'
    expect(page).to have_tag("ul:last-child", :text => "message2")
  end
end
