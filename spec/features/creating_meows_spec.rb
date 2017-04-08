feature 'Creating meows' do
  scenario 'form enables kitty to submit a new meow' do
    visit '/meows/new'
    fill_in(:message, with: 'Cat')
    click_button('Send meow!')

    expect(current_path).to eq '/meows'

    within 'ul#meows' do
      expect(page).to have_content('Cat')
    end
  end
end
