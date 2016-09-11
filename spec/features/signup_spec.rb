feature 'Chitter signup' do
  scenario 'Users can signup to Chitter to start peeping' do
    expect{ sign_up }.to change(User, :count).by(1)
    expect(current_path).to eq '/peeps'
    expect(page).to have_content('Hello marsu!')
  end
end
