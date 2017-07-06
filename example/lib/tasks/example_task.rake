namespace :example_task do
  desc "Example Task 1"
  task task_1: :environment do
    ExampleTaskHelper.task_1
  end

  desc "Example Task 2"
  task task_2: :environment do
    ExampleTaskHelper.task_2
  end
end
