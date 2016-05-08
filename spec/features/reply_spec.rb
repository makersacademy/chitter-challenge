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
    sign_in("paco@gmail.com", "321")
  end

  scenario 'displays a reply button' do
    expect(page).to have_link 'Reply'
  end

  scenario 'reply is displayed' do
    click_link 'Reply'
    fill_in(:message, with: "@pepe1purito! You're so right!")
    click_button 'Peep'
    expect(page).to have_content "@pepe1purito! You're so right!"
  end
end