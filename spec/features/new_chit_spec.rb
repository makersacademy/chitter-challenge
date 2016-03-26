feature 'Create a new chit' do
  scenario 'Creates a new chit' do
    visit('/new')
    fill_in(:post, with: 'This is my first ever chit')
    fill_in(:tags, with: '#Lads')
    click_button("Chit")
    expect(current_path).to eq ('/chits')
    expect(page).to have_content("This is my first ever chit")
  end
end
