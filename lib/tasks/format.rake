desc "format all html.erb files in app/views/**/*.html.erb with htmlbeautifier"


require 'htmlbeautifier'

task :format_views do
    exec("htmlbeautifier ./app/views/**/*.html.erb")
end

task :format_source do
    exec("yarn prettier ./app/**/*.rb --write")
end