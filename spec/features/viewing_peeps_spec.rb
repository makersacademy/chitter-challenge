feature 'Viewing peeps' do
  scenario 'I can view existing peeps' do
    user = create(:user)
    post_peep(user, "Hello!")
    visit '/peeps'
    expect(page).to have_content("Hello!")
  end
end
