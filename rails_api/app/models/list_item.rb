class ListItem < ActiveRecord::Base
    belongs_to :item
    # if we want to replace this with just :list, we can use the foreign key option
    belongs_to :my_list
    validates :my_list_id, presence: true
    validates :item_id, presence: true

    accepts_nested_attributes_for :item, 
                                  :reject_if => :all_blank

    #todo, the db has a unique constraint so maybe the model should as well?
    
                                  
end
