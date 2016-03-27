feature 'Viewing peeps' do

  let(:user) do
    User.create(name: 'Test Test', username: 'Test_test', email: 'test@test.com', password: 'test', password_confirmation: 'test')
  end

  scenario "I can see a peep I posted on the peep feed" do
    sign_in(email: user.email, password: user.password)
    click_button 'Peep'
    fill_in :content, with: "This is a test peep"
    click_button 'Post peep!'
    expect(page.status_code).to eq 200
    expect(page).to have_content('This is a test peep')
  end

end
