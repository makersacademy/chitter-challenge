feature 'add a peep' do
  scenario 'add a peep to Chitter' do
    sign_up
    sign_in
    expect(current_path).to eq('/chat')
    click_button('Peep a new message')
    expect(current_path).to eq('/chat/add')
    fill_in(:message, with: 'Hello world!')
    click_button('Peep!')
    expect(page).to have_content('Hello world!')
  end
end
