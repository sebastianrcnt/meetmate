desc "format all html.erb files in app/views/**/*.html.erb with htmlbeautifier"


require 'htmlbeautifier'

task :format_views do
    exec("htmlbeautifier ./app/views/**/*.html.erb")
end