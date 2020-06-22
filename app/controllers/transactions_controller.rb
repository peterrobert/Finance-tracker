class TransactionsController < ApplicationController
    before_action :authenticate_user!

    def index
        @transaction = current_user.transactions.all.sort_by(&:created_at).reverse
        @total =  current_user.transactions.sum(:amount)
    end

    def new
        @transaction = Transaction.new
    end

    def create
        @transaction = current_user.transactions.new(transaction_params)

        if @transaction.save
          
          if @transaction.group_id.nil?

            redirect_to home_external_path, notice: 'External expense was successfully created.'

          else

            redirect_to expenses_path, notice: 'Expense was successfully created.'

          end

          redirect_to transactions_path

        else

          render :new

        end
    end
    
    private

    def transaction_params
      params.require(:transaction).permit(:name, :amount, :group_id)
    end
    
end
