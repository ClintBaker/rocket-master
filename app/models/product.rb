class Product < ActiveRecord::Base
  belongs_to :user
  has_many :product_categories
  has_many :categories, through: :product_categories
  has_many :product_orders
  has_many :orders, through: :product_orders
  mount_uploader :image, ImageUploader
  validates :title, presence: true, length: { minimum: 3, maximum: 50 }
  validates :description, presence: true, length: { minimum: 10, maximum: 300 }
  validates :user_id, presence: true
  validates :price, presence: true
  validates_processing_of :image
  validate :image_size_validation

  private
  def image_size_validation
    errors[:image] << "should be less than 500KB" if image.size > 0.5.megabytes
  end
end
