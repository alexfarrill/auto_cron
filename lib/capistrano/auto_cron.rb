Capistrano::Configuration.instance.load do
  namespace :auto_cron do
    task :publish, :roles => :publish do
      run "cd #{release_path} && rake TEMPLATE=publish RAILS_ENV=#{rails_env} auto_cron"
    end

    desc "Connects to each box individual and installs the specifed cron 
          USAGE:: role :publish_cron, 'prilb', :crontab => 'cron' " 
    task :publish_crons, :roles => :publish_cron do
      find_servers_for_task( current_task ).each do |sd|
        establish_connections_to( sd )
        targets = []
        targets.push sessions[sd]
    
        Command.process( "cd #{release_path} && rake TEMPLATE=#{sd.options[:crontab]} RAILS_ENV=#{rails_env} auto_cron", 
                          targets, options.merge(:logger => logger), &block)

        logger.debug "creating crontab:#{sd.options[:crontab]} on #{sd.host}"
      end
    end
  end
end