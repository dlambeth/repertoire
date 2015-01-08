# lib/tasks/routes.rake
namespace :api do
  desc "API Routes"
  task :routes => :environment do
    API::Base.routes.each do |api|
      method = api.route_method.ljust(10)
      #swagger routes have the version prefilled in the path and no api.route_version property
      if !api.route_version.nil?
        path = api.route_path.gsub(":version", api.route_version)
      else
        path = api.route_path
      end
      puts "     #{method} #{path}"
    end
  end
end
