class Ad < ActiveRecord::Base
  belongs_to :member
  belongs_to :category

  validates_presence_of :title, :description, :category, :price, :picture


  # Scopes
  scope :descending_order, ->(quantity = 9) { limit(quantity).order(created_at: :desc) }
  scope :to_the, ->(member) { where(member: member) }


  # Paperclip
  has_attached_file :picture, styles: { large: "800x300#", medium: "320x150#", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :picture, content_type: /\Aimage\/.*\z/
  # Gem money_rails
  monetize :price_cents
end
