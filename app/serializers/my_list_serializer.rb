class MyListSerializer < ActiveModel::Serializer
  #for any has_many relationships (right now just items, but we intend to also have tags, 
  #embed the ids in the list json, and also include the objects, so 
  # my_lists = [{}], items = [{}])
  
  #embed :ids, include: true
  attributes :id, :title
  has_many :items, key: :items, embed: :ids
  #right now this is just returning the list_item ids which is ok I think
  #the only time we need the list_item id is to delete the item (and maybe change the order in the list eventually)
  has_many :list_items, key: :list_items, embed: :ids
end