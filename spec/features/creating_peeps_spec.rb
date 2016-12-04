feature "Creating peeps" do

  scenario 'a logged in user can create a new peep' do
    sign_up
    click_button 'New peep'
    content = "Test content. Test content. Test content."
    fill_in :content, with: content
    peep_time = Time.now
    click_button 'Post'
    expect(page).to have_content(content)
    expect(page).to have_content(peep_time)
    expect(page).to have_content('jsmith2016')
  end

end
