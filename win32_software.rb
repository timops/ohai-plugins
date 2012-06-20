require 'ruby-wmi'

provides 'installed_software'

installed_software Mash.new

apps = WMI::Win32_Product.find(:all)

apps.each do |app|
  installed_softwarestalled_software[app.packagename] = Mash.new
  %w(name version vendor packagenameckagename installdate).each do |attrib|
    installed_software[app.packagenameename][attrib] = app.send(attrib)
  end
end
