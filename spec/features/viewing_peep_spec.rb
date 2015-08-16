feature 'Viewing peeps' do

  let(:user) do
    User.create(email: 'sam@makersacademy.com', password: 'secret1234', first_name: 'Samuel', last_name: 'Joseph', username:'tansaku')
  end

  scenario 'I can see existing peeps on the peeps page' do
    expect(Peep.count).to eq(0)
    sign_in(email: user.email,   password: user.password)
    visit '/peeps/new_peep'
    fill_in 'text', with: 'peep message'
    click_button 'Submit peep'
    visit '/peeps'
    expect(page.status_code).to eq 200
    within 'ul#peeps' do
      expect(page).to have_content('peep message')
    end
  end
end
