module Presence
  def should_see_avatar(persona)
    within '#presence' do
      self.should have_content(persona.first_name)
    end
  end
  
  def should_not_see_avatar(persona)
    within '#presence' do
      self.should_not have_content(persona.first_name)
    end
  end
end