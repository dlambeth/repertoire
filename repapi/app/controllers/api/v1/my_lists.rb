module API
  module V1
    class MyLists < Grape::API
      include API::V1::Defaults

      resource :my_lists do
        desc "Return all lists"
        get "", root: :my_lists do
          MyList.all
        end

        desc "Return a list"
        params do
          requires :id, type: String, desc: "ID of the list"
        end
        get ":id", root: "my_list" do
          MyList.where(id: permitted_params[:id]).first!
        end
      end
    end
  end
end