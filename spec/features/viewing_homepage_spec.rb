feature 'Viewing homepage' do
  scenario 'Visiting the Chitter homepage' do
    visit('/')
    expect(current_path).to eq '/'
    expect(page).to have_content 'Welcome to Chitter! Try typing /chitter in the URL to get started.'
  end
end