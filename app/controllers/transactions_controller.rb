class TransactionsController < ApplicationController
    before_action :authenticate_user!

    def index
        @transaction = Transaction.all.sort_by(&:created_at).reverse
    end

    def new
        @transaction = Transaction.new
    end

    def create
        @transaction = current_user.transactions.new(transaction_params)
    
        if @transaction.save

          redirect_to transactions_path

        else

          render :new

        end

    end
    
    private

    def transaction_params
      params.require(:transaction).permit(:name, :amount)
    end
    
end
