module GroupsHelper
   def edit_delete_btn(user, group)

    if group.user_id == user.id
    links = [link_to("edit",  edit_group_path(group), class: "btn btn-primary edit_btn"), link_to("delete", group_path(group), class: "btn btn-danger delete_grp_btn", data: {confirm: "Are you sure?"}, method: :delete)]
      
    content_tag (:span) do
    links.collect{
        |l| concat content_tag(:span, l)
    }
    end
    end

   end
end
