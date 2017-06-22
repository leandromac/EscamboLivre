class Category < ActiveRecord::Base
    has_many :ads
    validates_presence_of :description

    # Scopes
    scope :order_by_description, -> { order(:description) }

end
