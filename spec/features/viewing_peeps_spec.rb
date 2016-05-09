

feature 'viewing peeps' do
  scenario 'peeps in reverse chronological order' do
    sign_in
    peep "Cats are the best"
    peep "I love horses"
    within "ul#peeps" do
      expect("I love horses").to appear_before "Cats are the best"
    end
  end

  scenario "show user handle and time" do
    message = "Batman IS better than Superman"
    sign_in
    peep message
    peep = Peep.first(content: message)
    within "ul#peeps" do
      expect(page).to have_content message
      expect(page).to have_content "MacDaNNy"
      expect(page).to have_content peep.created_at
    end
  end

  scenario "show everyone's peeps" do
    sign_in "wayne", "rumble@gmail.com"
    peep "Skiing is like so totally cool"
    sign_in "ferg", "fergio@gmail.com"
    peep "No way mate, snowboarding is totally cooler"
    expect(page).to have_content "wayne"
    expect(page).to have_content "ferg"
  end
end
