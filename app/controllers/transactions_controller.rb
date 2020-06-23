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

            redirect_to home_external_path, notice: 'Transaction expense was successfully created.'

          else

            redirect_to transactions_path, notice: 'Transaction was successfully created.'

          end

        else

          render :new

        end
    end

    def show
      @transaction = Transaction.find(params[:id])
    end

    def edit
      
    end
    
    def destroy
      
    end
    
    private

    def transaction_params
      params.require(:transaction).permit(:name, :amount, :group_id)
    end
    
end
