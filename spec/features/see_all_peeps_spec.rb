feature 'See peeps in reverse chronological order' do
  scenario 'User can see posted peeps in reverse chronological order' do
    post_peep('first peep')
    # sleep 2
    fill_in 'peep', with: 'last peep'
    click_button ('Peep')
    expect(page).to have_content("last peep", "first peep")
  end
end
