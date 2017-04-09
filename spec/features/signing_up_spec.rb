feature 'user uses sign in form' do

  scenario 'successful sign in' do
    sign_up_steph
    expect(page).to have_content 'Welcome to Chitter Steph!'
  end

  scenario 'email incorrectly formatted' do
    visit '/user/new'
    fill_in('name', with: 'Steph')
    fill_in('username', with: 'StephanieJane')
    fill_in('email', with: 'sdf.com')
    fill_in('password', with: 'steph123')
    fill_in('password_confirmation', with: 'steph123')
    expect {click_button('Submit')}.to change(User, :count).by(0)
  end

  scenario 'email blank' do
    visit '/user/new'
    fill_in('name', with: 'Steph')
    fill_in('username', with: 'StephanieJane')
    fill_in('password', with: 'steph123')
    fill_in('password_confirmation', with: 'steph123')
    expect {click_button('Submit')}.to change(User, :count).by(0)
  end

  scenario 'name blank' do
    visit '/user/new'
    fill_in('username', with: 'StephanieJane')
    fill_in('email', with: 'sdf@steph.com')
    fill_in('password', with: 'steph123')
    fill_in('password_confirmation', with: 'steph123')
    expect {click_button('Submit')}.to change(User, :count).by(0)
  end

  scenario 'username blank' do
    visit '/user/new'
    fill_in('name', with: 'Steph')
    fill_in('email', with: 'asd@sdf.com')
    fill_in('password', with: 'steph123')
    fill_in('password_confirmation', with: 'steph123')
    expect {click_button('Submit')}.to change(User, :count).by(0)
  end

  scenario 'password blank' do
    visit '/user/new'
    fill_in('name', with: 'Steph')
    fill_in('username', with: 'StephanieJane')
    fill_in('email', with: 'sdf@jgh.com')
    fill_in('password_confirmation', with: 'steph123')
    expect {click_button('Submit')}.to change(User, :count).by(0)
  end

  scenario 'password conformation blank' do
    visit '/user/new'
    fill_in('name', with: 'Steph')
    fill_in('username', with: 'StephanieJane')
    fill_in('email', with: 'sdf@hjbi.com')
    fill_in('password', with: 'steph123')
    expect {click_button('Submit')}.to change(User, :count).by(0)
  end

  scenario 'passwords do not match' do
    def sign_up_a
      visit '/user/new'
      fill_in('name', with: 'Steph')
      fill_in('username', with: 'StephanieJane')
      fill_in('email', with: 'Steph@stephanie.com')
      fill_in('password', with: 'steph123')
      fill_in('password_confirmation', with: 'dsfadf')
      expect {click_button('Submit')}.to change(User, :count).by(0)
    end
  end

end
