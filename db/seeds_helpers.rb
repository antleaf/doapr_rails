require 'logger'
require 'colorize'



LOG = Logger.new(STDOUT)
LOG.formatter = proc do |severity,datetime,progname, msg|
  if ["ERROR","FATAL"].include? severity then
    "#{severity}: #{msg}\n".red
  elsif severity == "DEBUG" then
    "#{severity}: #{msg}\n".light_yellow
  elsif severity == "WARN" then
    "#{severity}: #{msg}\n".light_magenta
  else
    "#{severity}: #{msg}\n".light_cyan
  end
end
LOG.level = Logger::DEBUG
STDOUT.sync = true