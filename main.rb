require 'notion-ruby-client'
require './libs/generate_parameter'

# database の property の名前
AUTHOR_LABEL = '著者'
STATUS_LABEL = 'Status'
URL_LABEL = 'URL'

client = Notion::Client.new(token: ENV['NOTION_INTEGRATION_TOKEN'])
database_id = ENV['DATABASE_ID']

author_name = "keisuke"
author_url = 'https://twitter.com/sa20220304'

book_title = "僕の本"
book_url = 'https://developers.notion.com/reference/property-value-object'

parent = parent(database_id:,)
properties = properties(author_url:, author_name:, book_title:, book_url:,)

client.create_page(parent:, properties:,)

