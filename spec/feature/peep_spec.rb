feature 'peeps' do
  scenario 'Can create peeps after sign up' do
    sign_up
    visit '/peeps/new'
    fill_in :message, with: 'Hello'
    click_button 'Create Peep'
    expect(current_path).to eq '/peeps'
    expect(page.status_code).to eq 200

    within 'ul#peeps' do
      expect(page).to have_content('Hello')
    end
  end
end
