feature 'Can reply to peeps' do
  let(:user) do
    User.create(name: 'test',
                username: 'test',
                email: 'test@test.com',
                password: '12345',
                password_confirmation: '12345')
  end
  scenario 'replying to a peep' do
    sign_in(email: 'test@test.com', password: '12345')
    visit '/peeps/new'
    fill_in 'peep',   with: 'testing testing 123'
    click_button 'Create Peep'
    expect(current_path).to eq '/peeps'
    click_link 'reply'
    fill_in 'reply', with: 'testing a reply'
    click_button 'Create Reply'
    expect(page).to have_content('testing a reply')
  end
end
