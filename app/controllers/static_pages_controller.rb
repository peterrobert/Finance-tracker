class StaticPagesController < ApplicationController
    before_action :authenticate_user! 
    
    def home    
    end

    def external
        user = User.find_by(id: current_user.id)
        @external_user_transactions = user.transactions.where(group_id: nil).order(created_at: :desc)
        @external_total = @external_user_transactions.sum(:amount)
    end
    
    def friends
        @users = User.where.not(id: current_user.id)
        @expenses = Expense.where.not(user_id: current_user.id)
    end
end
