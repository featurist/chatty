require 'rspec/expectations'
require_relative './posting'

module Personas
  class Persona < Capybara::Session
    include RSpec::Matchers
    include Login
    include Posting
    
    def initialize(first_name, last_name, email)
      @first_name, @last_name, @email = first_name, last_name, email
      super(:selenium, Capybara.app)
    end
    
    attr_reader :first_name, :last_name, :email, :browser
    
    def full_name
      self.first_name + " " + self.last_name
    end
    
    def destroy
      self.driver.browser.close
    end
  
    def password
      'topsecretpassword'
    end
  end
  
  def persona(first_name)
    @@personas.find do |p|
      p.first_name == first_name
    end or raise "No such persona"
  end
  
  @@personas = []
  
  def reset_personas
    @@personas.each &:destroy
    @@personas = [
      Persona.new("Josh", "Beardy", "joshbeardy@gmail.com"),
      Persona.new("Adrian", "Megabot", "adrianpersona@gmail.com")
    ]
  end
end
World(Personas)

Before do
  reset_personas
end