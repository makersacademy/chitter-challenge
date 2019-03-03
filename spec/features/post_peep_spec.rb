feature 'Makers can post their peeps' do
  scenario 'A maker sees a form and uses it to post a peep' do
    visit '/peeps/post'
      fill_in('message', with: "Another day in paradise")
      # fill_in('timestamp', with: "08:08")
      click_button('Submit')
      expect(page). to have_content("Another day in paradise")
    end
  end
