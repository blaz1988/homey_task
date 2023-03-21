require 'factory_bot_rails'

users = FactoryBot.create_list(:user, 5)

projects = FactoryBot.create_list(:project, 10, :with_comments)