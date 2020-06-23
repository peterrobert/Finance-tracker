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
    end

    def create
        @group = current_user.groups.new(fields_arr)

        if @group.save

            redirect_to groups_path
        else
            render :new

        end
    end

   # DELETE /groups/1.json
  def destroy
    @group = current_user.groups.find(params[:id])
    @group.destroy
   
    respond_to do |format|
      format.html { redirect_to groups_url, notice: 'group was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

    private 

    def fields_arr
        params.require(:group).permit(:name, :icon)
    end
end
