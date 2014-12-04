class MyList < ActiveRecord::Base
  belongs_to :user
  validates :user_id, presence: true
  validates :title, presence: true, length: { maximum: 150 }
  #stabby lambda, creates an anonymous function
  default_scope -> { order(created_at: :desc) }

  #TODO: decide if we want to enforce this
  #validates_uniqueness_of :title #, scope: :user_id

end
