feature 'Post a peep' do
  scenario 'A user can post a peep' do
    visit ('/peeps/post')
    fill_in 'new_peep', with: 'Hello world!'
    click_button 'OK'
    expect(page).to have_content('Hello world!')
  end
end
