module SignInHelper
  def sign_up_as_regular(user)
    visit new_user_registration_path
    fill_in "First name",   with: user.first_name
    fill_in "Last name",    with: user.last_name
    fill_in "Company",      with: user.company
    fill_in "Phone number", with: user.phone_number_primary
    fill_in 'Email',        with: user.email
    fill_in 'Password',     with: user.password
    click_on "Start For Free"
  end
end
