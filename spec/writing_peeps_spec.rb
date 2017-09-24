feature 'Writing Peeps' do
  scenario 'User can write a peep' do
    visit '/peeps/new'
    fill_in 'message', with: "Test Peep"
    @time = Time.now
    click_button 'Send Peep'
    expect(current_path).to eq('/peeps')
    within 'ul#peeps' do
      expect(page).to have_content('Test Peep')
      expect(page).to have_content(@time.strftime("%d%B%Y, %H:%M"))
    end
  end
end
