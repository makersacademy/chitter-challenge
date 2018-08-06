feature 'Viewing peeps' do
  scenario 'A user can see peeps' do
    visit '/'
    expect(page).to have_content '123'
    expect(page).to have_content '456'
    expect(page).to have_content '789'
  end
end