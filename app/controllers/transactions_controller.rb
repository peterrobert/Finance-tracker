class TransactionsController < ApplicationController
    before_action :authenticate_user!

    def index
        @transaction = current_user.transactions.all
        @other_transaction = @transaction.where.not(group_id: nil)
        @other_transaction_sorted = @other_transaction.sort_by(&:created_at).reverse
      
        @total = @other_transaction.sum(:amount)
        
    end

    def new
        @transaction = Transaction.new
    end

    def create

        @transaction = current_user.transactions.new(transaction_params)

        if @transaction.save
          
          if @transaction.group_id.nil?

            redirect_to external_path, notice: 'Transaction expense was successfully created.'

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

      @transaction = current_user.transactions.find(params[:id])
      
    end

    def update
      @transaction = current_user.transactions.find(params[:id])
      if @transaction.update(transaction_params)
       
        if @transaction.group_id.nil?

          redirect_to external_path, notice: 'external transaction was successfully updated.'
        else
          redirect_to transactions_path, notice: 'transaction was successfully updated.'
        end
        
       
      else
        render :edit
      end
   end
    
    def destroy

    @transaction = current_user.transactions.find(params[:id])
    @transaction.destroy
    redirect_back(fallback_location: root_path) 

      
    end
    
    private

    def transaction_params
      params.require(:transaction).permit(:name, :amount, :group_id)
    end
    
end
