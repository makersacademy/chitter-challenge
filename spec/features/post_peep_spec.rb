feature 'To post a message to Chitter' do
  scenario 'User creates a new Peep' do
    visit '/'

    click_button('Post a new Peep!')
    expect(current_path).to eq('/new-peep')

    fill_in('Your Peep', with: "I'm flyyiing!!")
    click_button('Submit')

    expect(current_path).to eq('/')
    expect(page).to have_content("I'm flyyyyingg!!")
  end
end
