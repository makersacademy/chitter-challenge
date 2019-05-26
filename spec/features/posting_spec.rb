feature "clicking 'Peep' and entering text" do
  scenario "should post your peep on the index page" do
    post_a_peep
    expect(page).to have_content('I feel grrrrrreat')
  end
end
