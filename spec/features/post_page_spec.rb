feature 'has a page for posting peeps' do
  scenario '#can enter a peep' do
    visit('/make_a_peep')
    fill_in :user, with: "Flounder (post spec)"
    fill_in :new_peep, with: "This is my first peep (post spec)"
    click_button('Submit')
  end
end
