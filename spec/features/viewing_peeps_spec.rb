feature "FEATURE: Peeps page" do
  let!(:peep1) { Peep.create(content: "My first peep!") }
  let!(:peep2) { Peep.create(content: "My second peep!") }


  # scenario "shows a list of peeps in reverse chronological order" do
  #   sign_up
  #   post_a_peep(content: peep1.content)
  #   post_a_peep(content: peep2.content)
  #   within 'ul#peeps' do
  #     expect(peep1).not_to appear_before(peep2)
  #   end
  # end

  scenario "unless logged in cannot post a peep" do
    visit '/peeps'
    expect(page).not_to have_button 'add_new_peep'
  end

  scenario "peep has a timestamp" do
    sign_up
    post_a_peep(content: peep1.content)
    expect(Peep.first.created_at).not_to eq nil
  end

end
