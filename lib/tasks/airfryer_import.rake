namespace :airfryer_import do
  desc 'Import Airfryer data'
  task :airfryers, [:xlsx_path] => :environment do |t, args|
    unless args[:xlsx_path]
      puts "You must provide a path to the xlsx file. E.g., rake airfryer_import:airfryers['path/to/file.xlsx']"

      next
    end

    airfryers_controller = AirfryersController.new
    airfryers_controller.import_data(args[:xlsx_path])
    puts "Airfryer data imported successfully from #{args[:xlsx_path]}"
  end
end
