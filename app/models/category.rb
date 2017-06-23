class Category < ActiveRecord::Base

    # Gem FriendlyId
    include FriendlyId
    friendly_id :description, use: :slugged

    has_many :ads
    validates_presence_of :description

    # Scopes
    scope :order_by_description, -> { order(:description) }

end
