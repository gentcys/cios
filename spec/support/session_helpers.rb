module SessionHelpers
  def sign_up_with(name, email, password)
    visit sign_up_path
    fill_in "Name", with: name
    fill_in "Email", with: email
    fill_in "Password", with: password
    fill_in "Password confirmation", with: password
    click_button "SIGNUP"
  end
end
