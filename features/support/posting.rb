module Posting
  def post_message(text)
    browser.fill_in 'Message', with: text
    browser.click_on 'Post'
  end
  
  def should_see_message(options)
    browser.within '#messages' do
      browser.should have_content(options[:text])
    end
  end
end