module API
  module V1
    class Items < Grape::API
      include API::V1::Defaults

      resource :items do
        desc "Return all items"
        get "", root: :items do
          Item.all
        end

        desc "Return an item"
        params do
          requires :id, type: String, desc: "ID of the item"
        end
        get ":id", root: "item" do
          Item.where(id: permitted_params[:id]).first!
        end
      end
    end
  end
end