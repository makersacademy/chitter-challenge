feature "User sign up" do
  scenario "I can sign up as a new user" do
    expect{ sign_up }.to change{ User.count }.by(1)
    expect(current_path).to eq '/'
  end

  # scenario "" do
  #   expect{ sign_up }.to change{ User.count }.by(1)
  #   expect(current_path).to eq ''
  # end

  scenario "I cannot sign up with mismatching password and confirmation" do
    expect{ sign_up(password_confirmation: 'wrong') }.not_to change{ User.count }
    #expect(current_path).to eq '/user/new'
  end

  # scenario "" do
  #   expect{ sign_up }.to change{ User.count }.by(1)
  #   expect(current_path).to eq ''
  # end
  #
  # scenario "" do
  #   expect{ sign_up }.to change{ User.count }.by(1)
  #   expect(current_path).to eq ''
  # end
  #
  # scenario "" do
  #   expect{ sign_up }.to change{ User.count }.by(1)
  #   expect(current_path).to eq ''
  # end


end
