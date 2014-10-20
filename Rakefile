require 'kitchen'

Kitchen::Config.new.instances.each do |instance|
  case instance.name
    when /vagrant/ 
      desc 'Run Test Kitchen with Vagrant'
      task :vagrant do
        Kitchen.logger = Kitchen.default_file_logger
        puts "Vagrant test"
      end
    when /aws/
      desc 'Run Test Kitchen in AWS'
      task :aws do
        Kitchen.logger = Kitchen.default_file_logger
        puts "AWS test"
      end
  end
end

task default: ['vagrant']
