
feature 'I can sign up to chitter' do
  scenario 'My details are stored and I am welcomed' do
    expect{signup}.to change{User.count}.by(1)
    expect(current_path).to eq '/session'
    expect(page).to have_content('Welcome User1')
  end
end
