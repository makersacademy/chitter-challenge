feature 'Viewing peeps' do

  scenario 'anyone can see the peeps' do
    sign_up
    click_button 'New peep'
    content = "Test content. Test content. Test content."
    fill_in :content, with: content
    peep_time = Time.now
    click_button 'Post'
    click_button 'Sign out'
    expect(page).to have_content(content)
    expect(page).to have_content(peep_time)
    expect(page).to have_content('jsmith2016')
  end
end
