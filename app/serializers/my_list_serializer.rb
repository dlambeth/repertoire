class MyListSerializer < ActiveModel::Serializer
  #for any has_many relationships (right now just items, but we intend to also have tags, 
  #embed the ids in the list json, and also include the objects, so 
  # my_lists = [{}], items = [{}])
  
  embed :ids, include: true
  attributes :id, :title
  has_many :items, key: :items
end