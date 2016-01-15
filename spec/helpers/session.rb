module SessionHelpers
  def user_sign_up(full_name: 'Wade Wilson',
                   username: 'Deadpool',
                   email: 'chimichongas@gmail.com',
                   password: 'ihatewolverine92',
                   password_confirmation: 'ihatewolverine92')
    visit '/'
    expect(page.status_code).to eq(200)
    fill_in('full_name', with: full_name)
    within("//section[@id='sign_up']") { fill_in('username', with: username) }
    fill_in('email', with: email)
    within("//section[@id='sign_up']") { fill_in('password', with: password) }
    within("//section[@id='sign_up']") do
      fill_in('password_confirmation', with: password_confirmation)
    end
    click_button('Sign up')
  end

  def user_log_in(username:, password:)
    visit '/'
    expect(page.status_code).to eq(200)
    within("//section[@id='log_in']") { fill_in('username', with: username) }
    within("//section[@id='log_in']") { fill_in('password', with: password) }
    click_button('Log in')
  end

  def first_chit
    @first_time = Time.local(2008, 9, 1, 10, 5, 0).strftime("%d %b at %H:%M")
    Timecop.freeze(Time.local(2008, 9, 1, 10, 5, 0))
    fill_in('chit_text', with: 'first chit')
    click_button('Chit!')
    Timecop.return
  end

  def second_chit
    @second_time = Time.local(2009, 4, 1, 11, 7, 0).strftime("%d %b at %H:%M")
    Timecop.freeze(Time.local(2009, 4, 1, 11, 7, 0))
    fill_in('chit_text', with: 'second chit')
    click_button('Chit!')
  end

  def user_log_out_and_view_chits
    click_button('Log out')
    click_button('View chits')
  end
end
