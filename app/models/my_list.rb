class MyList < ActiveRecord::Base
  belongs_to :user
  # do I need both of these statements?
  has_many :list_items
  has_many :items, :through => :list_items

  validates :user_id, presence: true
  validates :title, presence: true, length: { maximum: 150 }
  #stabby lambda, creates an anonymous function
  default_scope -> { order(created_at: :desc) }

  #TODO: decide if we want to enforce this
  #validates_uniqueness_of :title #, scope: :user_id

  #sets up the ability to change list items when we modify the list
  accepts_nested_attributes_for :list_items, 
      :reject_if => :all_blank, 
      :allow_destroy => true

  accepts_nested_attributes_for :items
  
end
