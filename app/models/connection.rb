class Connection < ActiveRecord::Base
  include Stateflow

  belongs_to :sender, class_name: 'User', foreign_key: 'sender_id'
  belongs_to :receiver, class_name: 'User', foreign_key: 'receiver_id'
  belongs_to :relationship_type


  scope :pending, where(state: 'pending')
  scope :approved, where(state: 'approved')

  stateflow do
    initial :pending

    state :pending, :rejected, :approved

    state :approved do
      enter :create_and_approve_inverse_connection!
    end

    event :approve do
      transitions :from => :pending, :to => :approved
    end

    event :reject do
      transitions :from => :pending, :to => :rejected
    end
  end

  def legal_relationship_types
    return [] unless sender && receiver
    RelationshipType.all
  end

  def inverse_connection
    Connection.where(sender_id: self.receiver, receiver_id: self.sender).first
  end

  protected

  def create_and_approve_inverse_connection!
  end
end
