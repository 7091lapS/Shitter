def sign_in(user)
  click_link('Sign in')
  fill_in('Login', with: user.username)
  fill_in('Password', with: user.password)
  click_button('Log in')
end
