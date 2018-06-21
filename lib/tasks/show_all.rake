
  desc "TODO"
  task show: :environment do
    projects =  Project.all
    projects.each do |one_project|
      puts one_project.title
      one_project.items.each do |one_item|
        if one_item.done
        puts "- [X] " + one_item.action
        else
          puts "- [ ] " + one_item.action
      end

      end
    end
  end

