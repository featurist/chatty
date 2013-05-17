module Login
  def login
    visit '/'
    click_link 'Login with Google'
    fill_in 'Email', with: self.email
    fill_in 'Password', with: self.password
    click_on 'Sign in'
    begin
      click_on 'Allow access'
    rescue
    end
    should have_content(self.full_name)
  end
end