module Login
  def login
    browser.visit '/'
    browser.click_link 'Login with Google'
    browser.fill_in 'Email', with: self.email
    browser.fill_in 'Password', with: self.password
    browser.click_on 'Sign in'
    begin
      browser.click_on 'Allow access'
    rescue
    end
    browser.should have_content(self.full_name)
  end
end