module Posting
  def post_message(text)
    fill_in 'Message', with: text
    click_on 'Post'
  end
  
  def should_see_message(options)
    within '#posts' do
      self.should have_content(options[:text])
    end
  end
end