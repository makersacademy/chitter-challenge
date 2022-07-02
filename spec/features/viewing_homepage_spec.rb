feature 'Viewing peep homepage' do
  scenario 'visiting the peep homepage' do
    visit('/')
    expect(page).to have_content "Welcome to Chitter!"
  end
end
