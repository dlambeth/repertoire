class Item < ActiveRecord::Base
  belongs_to :user
  validates :user_id, presence: true
  validates :title, presence: true, length: { maximum: 150 }
  #stabby lambda, creates an anonymous function
  default_scope -> { order(title: :asc) }
end
