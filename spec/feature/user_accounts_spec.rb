feature 'user account' do
  scenario 'user signs up sent to peeps page' do
    signup
    expect(page).to have_current_path('/peeps')
  end

  scenario 'user signs up and sees welcome messaege' do
    signup
    expect(page).to have_content("Ian's Peeps")
  end
end
