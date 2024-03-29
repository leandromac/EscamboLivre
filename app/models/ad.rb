class Ad < ActiveRecord::Base
  searchkick

  # Statys Payment
  enum status: [:active, :processing, :sold]

  # Constante
  QTT_PER_PG = 9

  # RatyRate Gem
  ratyrate_rateable 'quality'

  before_save :md_to_html

  belongs_to :member
  belongs_to :category, counter_cache: true
  has_many :comments

  validates :title, :description_md, :description_short, :category, :picture, :finish_date, presence: true
  validates :price, numericality: { greater_than: 0 }


  # Scopes
  scope :descending_order, ->(page) {
    order(created_at: :desc).page(page).per(QTT_PER_PG)
  }

#  scope :search, ->(q, page) {
#    where("lower(title) LIKE ?", "%#{q.downcase}%").page(page).per(QTT_PER_PG)
#  }

  scope :to_the, ->(member, page) { where(member: member) }
  scope :by_category, ->(id, page) { where(category: id).page(page).per(QTT_PER_PG) }
  scope :random, -> (quantity) { limit(quantity).order("RANDOM()") }

  # Paperclip
  has_attached_file :picture, styles: { large: "800x300#", medium: "320x150#", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :picture, content_type: /\Aimage\/.*\z/
  # Gem money_rails
  monetize :price_cents

  def md_to_html
    options = {
        filter_html: true,
        link_attributes: {
            rel: "nofollow",
            target: "_blank"
        }
    }

    extensions = {
        space_after_headers: true,
        autolink: true
    }

    renderer = Redcarpet::Render::HTML.new(options)
    markdown = Redcarpet::Markdown.new(renderer, extensions)

    self.description = markdown.render(self.description_md).html_safe
  end

  def second
    self[1]
  end

  def third
    self[2]
  end

end
