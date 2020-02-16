feature 'has a page for posting peeps' do
  scenario '#can enter a peep' do
    visit('/make_a_peep')
    fill_in :user_name, with: "Flounder"
    fill_in :peep, with: "This is my first peep"
    click_button('Submit')
  end
end
