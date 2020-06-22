class GroupsController < ApplicationController
    before_action :authenticate_user!
    
    def index
        @groups = Group.all
    end

    def new
        @group = Group.new
    end

    def create
        @group = current_user.groups.new(fields_arr)

        if @group.save

            redirect_to groups_path
        else
            render :new

        end
    end

    private 

    def fields_arr
        params.require(:group).permit(:name, :icon)
    end
end
