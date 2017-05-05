feature 'Registers users' do
  scenario 'a new user registers to the website' do
    expect{ signup }.to change(User, :count).by(1)
    expect(current_path).to eq '/posts'
    expect(page).to have_content('Welcome to Chitter, Sophie!')
  end
end
