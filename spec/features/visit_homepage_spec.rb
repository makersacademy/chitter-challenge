feature 'Visit homepage' do
  scenario 'User visits the homepage' do
    visit('/')
    expect(current_path).to eq '/'
    expect(page).to have_content 'Chitter, home of the peeps'
  end
end