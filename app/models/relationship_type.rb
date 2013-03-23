class RelationshipType < ActiveRecord::Base
  has_many :connections
end
