feature 'Signing up' do

  scenario 'user can sign up' do
    sign_up
    expect(page).to have_content 'Welcome to Chitter test'
  end

  scenario 'new users are added to the database' do
    expect { sign_up }.to change(User, :count).by(1)
  end

  scenario 'after going through a walk through user can send first Peep' do
    sign_up
    click_button 'Send my first Peep'
    expect(page).to have_content 'Post your first peep!'
  end

end
