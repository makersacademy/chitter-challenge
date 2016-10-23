feature 'posting peeps' do

  let!(:user) do

    User.create(email: 'user@example.com',
                name: 'name',
                password: 'secret1234',
                password_confirmation: 'secret1234')
  end

  scenario 'Can create peeps after sign up'  do
    sign_up_and_create_peep('Test text')
    expect(current_path).to eq '/peeps'
    expect(page.status_code).to eq 200

    within 'ul#peeps' do
      expect(page).to have_content('Test text')
    end
  end

  scenario 'I cannot post a peep if not signed in' do

      sign_in(email: user.email, password: user.password)
      click_button 'Sign out'
      expect(page).not_to have_content ("what's peeping?")
  end

end
