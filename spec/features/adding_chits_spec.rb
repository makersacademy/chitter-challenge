feature 'Adding chits' do
  scenario 'I can add a peep ' do
    signup
    visit '/add'
    fill_in 'content', with: 'Today is great'
    click_button 'submit'
    expect(page).to have_content "Content: Today is great Time: #{Time.new}"
  end
end
