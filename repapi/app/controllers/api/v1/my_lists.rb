module API
  module V1
    class MyLists < Grape::API
      include API::V1::Defaults

      resource :my_lists do
        desc "Return all lists for a given user"
        get "", root: :my_lists do
          MyList.all
        end

        desc "Return a list for a given user"
        params do
          requires :id, type: String, desc: "ID of the list"
        end
        get ":id", root: "my_list" do
          MyList.where(id: permitted_params[:id]).first!
        end

        #desc "Create a list"
        #params do
        #  requires :title, type: String, desc: "Title of the list"
        #end
        #post do
          #authenticate!
          #???replace with current_user.lists.build(mylist_params)
        #  MyList.create!({
            #user: current_user,
        #    user: 1
        #    title: params[:title]
        #  })
        #end
      end
    end
  end
end