module SessionHelpers

  # def enter_new_link(title, tag)
  #   visit('/links/new')
  #
  #   fill_in :title , with: title
  #   fill_in :url , with: "www.example.com"
  #   fill_in :tags , with: tag
  #   click_button('Create Link')
  # end

  def sign_up(email: 'dog@example.com',
                password: 'oranges!',
                password_confirmation: 'oranges!')
    visit '/users/new'
    within("#sign_up_form") do
    expect(page.status_code).to eq(200)
      fill_in :email,    with: email
      fill_in :password, with: password
      fill_in :password_confirmation, with: password_confirmation
      click_button 'Sign up'
    end
  end

  def sign_in(email:, password:)
    visit '/'
    within("#sign_in_form") do
      fill_in :email, with: email
      fill_in :password, with: password
      click_button 'Sign in'
    end
  end

end
