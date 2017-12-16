feature "Create new tweets" do
  scenario "there is a button to create tweets" do
    visit '/tweets'
    find_button 'new tweet'
  end
end
