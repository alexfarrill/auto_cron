require 'auto_cron/railtie' if defined?(Rails)

class AutoCron
  def initialize( template, application )
    require 'erb'

    @auto_cron_dir = File.join( Rails.root, "config", "auto_cron" )
    @template = template
    @application = application
  end

  def updated_crontab
    # Check for unopened or unclosed identifier blocks
    if read_crontab.index(comment_open) && !read_crontab.index(comment_close)
      warn "[fail] Unclosed indentifier; Your crontab file contains '#{comment_open}', but no '#{comment_close}'"
      exit(1)
    elsif !read_crontab.index(comment_open) && read_crontab.index(comment_close)
      warn "[fail] Unopened indentifier; Your crontab file contains '#{comment_close}', but no '#{comment_open}'"
      exit(1)
    end
  
    # If an existing identier block is found, replace it with the new cron entries
    if read_crontab.index(comment_open) && read_crontab.index(comment_close)
      read_crontab.gsub(Regexp.n#ew("#{comment_open}.+#{comment_close}", Regexp::MULTILINE), auto_cron_wrapped.chomp)
    else 
      # Otherwise, append the new cron entries after any existing ones
      [read_crontab, auto_cron_wrapped].join("\n\n")
    end
  end

protected

  def auto_cron_wrapped
    @auto_cron_wrapped ||= [comment_open, auto_cron_inner, comment_close].join("\n") + "\n"
  end

  def auto_cron_inner
    header_template = File.join( @auto_cron_dir, 'header.erb' ) 
    header = if File.exist?( header_template )
      ERB.new( File.read( header_template ) ).result
    else
      ''
    end
    full_template_path = File.join( @auto_cron_dir, "#{ @template }.erb" )
    header + "\n\n" + ERB.new( File.read( full_template_path ) ).result
  end

  def read_crontab
    return @current_crontab if @current_crontab
  
    # command = ['crontab -l']
    # command_results  = %x[#{command.join(' ')} 2> /dev/null]
    # @current_crontab = $?.exitstatus.zero? ? command_results : ''
    
    @current_crontab = %x[crontab -l 2> /dev/null]
  end

  def comment_base
    "auto_cron generated tasks for: #{ @application }"
  end

  def comment_open
    "# Begin #{ comment_base }"
  end

  def comment_close
    "# End #{ comment_base }"
  end

end
