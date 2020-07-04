feature 'User posts a peep' do
  scenario 'user can post a message' do
    visit('/')
    fill_in "peep", :with => "Hello, Twitter!"
    click_button('Peep')
    expect(page).to have_content('Hello, Twitter!')
  end
end
