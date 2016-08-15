feature 'Reply to a message' do
  let(:pepe) do
    User.create(SessionHelpers::PARAMS_CORRECT)
  end
    let(:paco) do
    User.create(SessionHelpers::PARAMS_CORRECT)
  end
  before do
    #
    sign_in_and_peep(pepe, "cats are evil")
    click_button 'Sign out'
    sign_in(email:paco.email, password:paco.password)
  end

  scenario 'displays a reply link' do
    expect(page).to have_content "Peeps"
    expect(page).to have_link 'reply to peep'
  end

  scenario 'reply is displayed' do
    click_link 'reply to peep'
    fill_in(:message, with: "@pepe1purito! You're so right!")
    click_button 'Peep'
    expect(page).to have_content "@pepe1purito! You're so right!"
  end
end