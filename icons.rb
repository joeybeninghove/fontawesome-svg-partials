require "oga"
require "pathname"

svg_dir_names = %w(brands regular solid)

svg_dir_names.each do |dir_name|
  svg_dir_path = Pathname.new("./svg").join(dir_name)
  partial_dir_path = Pathname.new("./partials").join(dir_name)

  puts "building #{svg_dir_path}"
  Dir.each_child(svg_dir_path) do |filename|  
    puts "bulding #{filename}"
    svg_doc = Oga.parse_html(File.read(svg_dir_path.join(filename)))
    svg_doc.at_css("svg").set("class", "fill-current <%= defined?(classes) ? classes : nil %>")
    html = svg_doc.to_xml.gsub("&lt;", "<").gsub("&gt;", ">")

    filename = "_#{File.basename(filename, ".svg")}.html.erb"
      
    File.open(partial_dir_path.join(filename), "w") do |f|
      f.write(html)
    end
  end
end
