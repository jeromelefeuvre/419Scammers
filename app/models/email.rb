class Email < ActiveRecord::Base
  
  validates_email_format_of :email
  
  
  acts_as_state_machine :initial => :added
  
  state :added
  state :confirmed
  state :validated
  
  event :confirm do
    transitions :from => :added, :to => :confirmed
  end
  
  event :validate do
    transitions :from => :confirmed, :to => :validate
  end
end
