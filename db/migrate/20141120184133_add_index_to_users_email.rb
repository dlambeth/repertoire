class AddIndexToUsersEmail < ActiveRecord::Migration
  def change
    #add index to enforce uniqueness, whether or 
    #not its case insensitive depends on the database adapter
    #so we will enforce lower case addresses back in the 
    #model
    add_index :users, :email, unique: true
  end
end
