feature 'Register' do
  scenario 'button appears on top of page' do
    visit('/')
    expect(page).to have_button('Register')
  end

  scenario 'clicking on button leads to /users/new' do
    visit('/')
    find('#register-form').find('#register').click
    expect(current_path).to eq('/user/register')
  end

  scenario '/users/new contains register form' do
    visit('/')
    find('#register-form').find('#register').click
    expect(page).to have_css('#register')
  end

  scenario 'register form contains elements' do
    visit('/')
    find('#register-form').find('#register').click
    ['#name', '#username', '#email', '#password'].each do |element|
      expect(page).to have_css(element)
    end
  end

  scenario 'submit leads to post /user/register' do
    visit('/')
    find('#register-form').find('#register').click
    find('#register').find('#submit').click
    expect(current_path).to eq('/user/register')
  end

  scenario 'params present in post /user/register' do
    register
    register_details.each do |details|
      expect(page).to have_content(details[:field_input])
    end
  end
end
