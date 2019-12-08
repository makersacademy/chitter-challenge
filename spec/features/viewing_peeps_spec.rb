feature 'Viewing peeps' do
  scenario 'A user can see peeps' do
    siggning_in
    fill_in 'text', with: 'random peep'
    click_button 'Submit'
    expect(page).to have_content 'random peep'
  end
end
