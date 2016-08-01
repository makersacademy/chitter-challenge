feature 'User peeps' do
  scenario 'While being signed in I can post peeps' do
    create_user
    sign_in
    fill_in :text, with: "Hello, world!"
    click_button 'Peep'
    expect(current_path).to eq '/'
    within 'ul#peeps' do
      expect(page).to have_content('Hello, world!')
    end
  end
end
