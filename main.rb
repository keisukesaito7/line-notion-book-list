require 'notion-ruby-client'
require './libs/generate_parameter'
require './libs/const'

# Notion client
client = Notion::Client.new(token: ENV['NOTION_INTEGRATION_TOKEN'])

# param1: parent
database_id = ENV['DATABASE_ID']
parent = parent(database_id:,)

# param2: properties
author_name = "keisuke"
author_url = 'https://twitter.com/sa20220304'
book_title = "僕の本"
book_url = 'https://developers.notion.com/reference/property-value-object'
properties = properties(author_url:, author_name:, book_title:, book_url:,)

# request create page
client.create_page(parent:, properties:,)

