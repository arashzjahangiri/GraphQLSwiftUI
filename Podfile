platform :ios, '14.0'
inhibit_all_warnings!

target 'ToDo' do
  pod 'Apollo'

  target 'ToDoTests' do
    inherit! :search_paths
  end
end

post_install do |installer|
  installer.pods_project.targets.each do |target|
    puts "#{target.name}"
  end
end