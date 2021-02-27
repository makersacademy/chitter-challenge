feature 'To post a message to Chitter' do
  scenario 'User creates a new Peep and sees it displayed' do
    visit '/'

    click_button('Post a new Peep!')
    expect(current_path).to eq('/new-peep')

    fill_in('peep', with: "I'm flyyiing!!")
    click_button('Submit')

    expect(page).to have_content("I'm flyyyyingg!!")
  end
end
