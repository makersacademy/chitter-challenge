feature "Viewing timestamps on peeps" do
  scenario "When viewing posted peeps" do
    sign_up
    fill_in('peep', with: 'Not a peep...')
    click_button('Peep!')
    within('ul#peeps') do
      expect(page).to have_content("Posted on: #{Time.new.asctime}")
    end
  end
end
