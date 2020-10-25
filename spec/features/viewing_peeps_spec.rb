feature 'viewing peeps' do
  scenario 'A user can see peeps' do
    visit('peeps/list')

    expect(page).to have_content "Test peep content"
  end

end
