feature 'Makers can post their peeps' do
  scenario 'A maker sees a form and uses it to post a peep' do
    visit '/peeps/post'
      fill_in('message', with: "XXXX")
      click_button('Submit')
      expect(page).to have_content("XXXX")
    end
  end
