feature 'Creating messages' do

  scenario 'I can create a new messagee' do
    visit '/messages/new'
    fill_in 'message',   with: 'Hello, Marco'
    click_button 'Create message'

    expect(current_path).to eq '/messages'

    within 'ul#messages' do
      expect(page).to have_content('Hello, Marco')
    end
  end
end
