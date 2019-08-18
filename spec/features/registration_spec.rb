require_relative 'web_helpers'

feature 'registration' do
  scenario 'a user can sign up to chitter' do
    sign_in

    expect(page).to have_content 'example@lycos.com'
  end
end
