class GroupsController < ApplicationController
    before_action :authenticate_user!
    
    def index
        @groups = Group.all
    end

    def new
        @group = Group.new
    end

    def show
        @group = current_user.groups.find(params[:id])
        @transaction = @group.transactions
        @total = @transaction.sum(:amount)
    end

    def create
        @group = current_user.groups.new(fields_arr)

        if @group.save

            redirect_to groups_path
        else
            render :new

        end
    end

    def edit
        @group = current_user.groups.find(params[:id])
    end

    def update
        @group = current_user.groups.find(params[:id])
        if @group.update(fields_arr)

          redirect_to groups_path, notice: 'Group was successfully updated.'
        else
          render :edit
        end
    end
    

   # DELETE /groups/1.json
  def destroy
    @group = current_user.groups.find(params[:id])
    @group.destroy
   
    redirect_back(fallback_location: root_path) 
  end

    private 

    def fields_arr
        params.require(:group).permit(:name, :icon)
    end
end
