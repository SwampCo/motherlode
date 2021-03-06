class Nugget
  include Mongoid::Document
  belongs_to :category
  belongs_to :user

  #embeds_many :contents, cascade_callbacks: true
  #accepts_nested_attributes_for :contents, :allow_destroy => true

  embeds_many :images, cascade_callbacks: true
  accepts_nested_attributes_for :images, :allow_destroy => true

  embeds_many :locations, cascade_callbacks: true
  accepts_nested_attributes_for :locations, :allow_destroy => true

  field :title, type: String
  field :content, type: String
  field :approved, type: Boolean, default: false

  scope :approved, ->{ where(approved: true) }
  scope :awaiting, ->{ where(approved: false) }

  def indented_title
    title
  end

  # All nugget content is stored in an array of embedded documents which are persisted Content entities.
end