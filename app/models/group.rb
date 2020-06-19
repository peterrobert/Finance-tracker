class Group < ApplicationRecord
    belongs_to :user
    
    has_and_belongs_to_many :trans_groups, :join_table => "trans_groups", :class_name => "Transaction"

   
end