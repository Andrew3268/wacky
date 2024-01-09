namespace :import do
  desc 'Uploads Daily Saving data from xlsx file'

  task :daily_savings, [:xlsx_path] => :environment do |t, args|
    unless args[:xlsx_path]
      puts "You must provide a path to the xlsx file. E.g., rake import:daily_savings['path/to/file.xlsx']"
      next
    end

    daily_savings_controller = DailySavingsController.new
    daily_savings_controller.import_data(args[:xlsx_path])
    puts "Daily Saving data imported successfully from #{args[:xlsx_path]}"
  end
end
