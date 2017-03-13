feature "Viewing peeps" do
  scenario "User can see a list of peeps" do
    sign_up
    write_a_peep
    within 'ul#peeps' do
      expect(page).to have_content("It's sunny today :)")
    end
  end
end
