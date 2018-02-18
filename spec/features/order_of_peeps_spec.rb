feature 'Order of peeps' do
  scenario 'Peeps are displayed in reverse chronological order' do
    old_peep = 'Hello everybody!'
    new_peep = 'Programming has never been more fun'
    visit('/')
    fill_in('peep', with: old_peep)
    click_button('Post your peep')
    fill_in('peep', with: new_peep)
    click_button('Post your peep')
    expect(old_peep).to appear_below(new_peep)
  end
end
