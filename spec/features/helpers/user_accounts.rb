module UserAccountHelpers

  def default_params
    { username: "jbloggs",
      first_name: "Joe",
      last_name: "Bloggs",
      email: "name@example.com",
      password: "abc",
      confirm_password: "abc" }
  end

  def sign_up params = default_params
    visit_and_check '/users/new'
    fill_in_fields combine_params_with_defaults(params)
    click_button "Sign up"
  end

  def sign_in params = { username: "jbloggs", password: "abc" }
    visit_and_check '/sessions/new'
    fill_in_fields params
    click_button "Sign in"
  end

  def sign_out
    visit '/'
    click_button "Sign out"
  end

  def fill_in_fields params_hash
    params_hash.each { |field, content| fill_in field, with: content }
  end

  def combine_params_with_defaults params_given
    combined_hash = {}
    default_params.each { |k, v| combined_hash[k] = params_given.fetch(k, v) }
    combined_hash
  end

  def visit_and_check path
    visit path
    expect(page.status_code).to eq 200
  end

end