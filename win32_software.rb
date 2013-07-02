require 'ruby-wmi'

provides 'installed_software'

installed_software Mash.new

apps = WMI::Win32_Product.find(:all)

apps.each do |app|
  installed_software[app.packagename] = Mash.new
  %w(name version vendor packagename installdate).each do |attrib|
    installed_software[app.packagename][attrib] = app.send(attrib)
  end
end
