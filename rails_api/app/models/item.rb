class Item < ActiveRecord::Base
  belongs_to :user
  
  has_many :list_items, dependent: :destroy
  has_many :my_lists, :through => :list_items

  validates :user_id, presence: true
  validates :title, presence: true, length: { maximum: 150 }
  #stabby lambda, creates an anonymous function
  default_scope -> { order(title: :asc) }
end
