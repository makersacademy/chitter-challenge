feature 'signup' do

  scenario 'I should be welcomed with my email after signing up' do
    sign_up_as_clement
    expect(page).to have_text "Welcome Clement!"
  end

  scenario 'I am stored in User table after signing up for the first time' do
    expect{ sign_up_as_clement }.to change(User, :count).by(1)
  end

  # scenario 'I am not stored in User table after signing up with the same email twice' do
  #   sign_up_as_clement
  #   expect{ sign_up_as_clement }.to change(User, :count).by(2)
  # end

end
