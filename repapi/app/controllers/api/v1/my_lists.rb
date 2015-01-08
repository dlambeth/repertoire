module API
  module V1
    class MyLists < Grape::API
      include API::V1::Defaults

      resource :mylist do
        desc "Return all lists"
        get "", root: :mylist do
          MyList.all
        end

        desc "Return a list"
        params do
          requires :id, type: String, desc: "ID of the list"
        end
        get ":id", root: "list" do
          MyList.where(id: permitted_params[:id]).first!
        end
      end
    end
  end
end