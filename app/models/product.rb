class Product < ActiveRecord::Base

  default_scope :order => 'title'
  has_many :line_items

  validates :title, :description, :image_url, :presence => true
  validates :price, :numericality => {:greater_than_or_equal_to => 0.01}
  validates :title, :uniqueness => true
  validates :image_url, :format => {
      :with => %r{\.(gif|jpg|png)$}i,
      :message => 'must be jpg, gif, or png!'
  }

  before_destroy :ensure_not_referenced

  private
  def ensure_not_referenced
    if line_items.empty?
      true
    else
      errors.add(:base, 'Line Items Present!')
      false
    end
  end

end
