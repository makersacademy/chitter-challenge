require_relative '../app/models/user'

describe User do


  it{is_expected.to respond_to(:username)}
  it{is_expected.to respond_to(:real_name)}
  it{is_expected.to respond_to(:email)}
  it{is_expected.to respond_to(:password)}
  it{is_expected.to respond_to(:password_confirmation)}

end
