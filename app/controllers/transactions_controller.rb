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

      @transaction = current_user.transactions.find(params[:id])
      
    end

    def update
      @transaction = current_user.transactions.find(params[:id])
      if @transaction.update(transaction_params)

        redirect_to transactions_path, notice: 'transaction was successfully updated.'
      else
        render :edit
      end
   end
    
    def destroy

    @transaction = current_user.transactions.find(params[:id])
    @transaction.destroy
   
    respond_to do |format|
      format.html { redirect_to transactions_url, notice: 'Transaction was successfully destroyed.' }
      format.json { head :no_content }
    end
      
    end
    
    private

    def transaction_params
      params.require(:transaction).permit(:name, :amount, :group_id)
    end
    
end
