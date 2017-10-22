feature 'Maker sign up' do
  scenario 'I can sign up as a Maker to use Chitter' do
    expect { sign_up }.to change(Maker, :count).by(1)
    expect(page).to have_content('Welcome, timjones10')
    expect(Maker.first.email).to eq('timjones10@hotmail.com')
  end

  scenario 'requires a matching confirmation password' do
    expect { sign_up(password_confirmation: 'wrong') }.not_to change(Maker, :count)
  end

  def sign_up(email: 'timjones10@hotmail.com',
              password: '12345678',
              password_confirmation: '12345678')
    visit '/maker/new'
    fill_in :name, with: 'Tim'
    fill_in :username, with: 'timjones10'
    fill_in :email, with: email
    fill_in :password, with: password
    fill_in :password_confirmation, with: password_confirmation
    click_button 'Sign up'
  end

  scenario 'with a password that does not match' do
  expect { sign_up(password_confirmation: 'wrong') }.not_to change(Maker, :count)
  expect(current_path).to eq('/makers')
  expect(page).to have_content 'Password and confirmation password do not match'
end

scenario "I can't sign up without an email address" do
   expect { sign_up(email: nil) }.not_to change(Maker, :count)
 end

 scenario "I can't sign up with an invalid email address" do
    expect { sign_up(email: "invalid@email") }.not_to change(Maker, :count)
  end

end
