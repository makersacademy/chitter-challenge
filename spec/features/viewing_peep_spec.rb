feature 'Viewing peeps' do

  let(:user) do
    User.create(email: 'sam@makersacademy.com', password: 'secret1234', first_name: 'Samuel', last_name: 'Joseph', username:'tansaku')
  end

  scenario 'User can see existing peeps on the peeps page' do
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

  scenario 'User can view all peeps in reverse chronolgical order' do
    sign_in(email: user.email,   password: user.password)
    visit '/peeps/new_peep'
    fill_in 'text', with: 'first message'
    click_button 'Submit peep'
    visit '/peeps/new_peep'
    fill_in 'text', with: 'second message'
    click_button 'Submit peep'
    expect(Peep.count).to eq(2)
    visit '/peeps'
    expect(page.status_code).to eq 200
    expect(find("ul#peeps > li:nth-child(1)")).to have_text("second message")
    expect(find("ul#peeps > li:nth-child(2)")).to have_text("first message")
    #expect(page.all('ul#peeps')).to have_content('first message')
    # within 'ul#peeps' do
    #   expect(page.all('/peeps')[0]).to have_content('first message')
    # end
    # visit '/peeps'
    # expect(page.status_code).to eq 200
    # within 'ul#peeps' do
    #   expect(page).to have_content('peep message')
    # end
  end
end
