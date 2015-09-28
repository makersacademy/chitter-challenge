feature 'Viewing peeps' do

  let(:user) do
   User.create(email: 'user@example.com',
               password: 'secret1234',
               password_confirmation: 'secret1234',
               name: 'Anthony',
               username: 'adellanno')
  end

  scenario 'Every peep will contain the name of the person who posted it' do
    visit '/peeps/new'
    sign_in(email: user.email, password: user.password)
    click_button 'New Peep'
    fill_in 'body', with: 'test peep'
    click_button 'Post Peep'

    expect(current_path).to eq '/peeps'
    expect(page).to have_content('Anthony')
  end
end


