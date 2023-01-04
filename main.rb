require 'notion-ruby-client'

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

def parent(database_id:)
  {
    database_id:
  }
end

def properties(author_name:, author_url:, book_title:, book_url:)
  {
    'Name': {
      'title': [
        {
          'text': {
            'content': book_title
          }
        }
      ]
    },
    "#{AUTHOR_LABEL}": {
      'rich_text': [
        {
          'type': 'text',
          'text': {
            'content': author_name,
            'link': {
              'url': author_url
            }
          },
          'plain_text': author_name,
          'href': author_url
        }
      ]
    },
    "#{STATUS_LABEL}": {
      'type': 'status',
      'status': {
        'name': 'Not started'
      }
    },
    "#{URL_LABEL}": {
      "type": "url",
      "url": book_url
    }
  }
end

parent = parent(database_id:,)
properties = properties(author_url:, author_name:, book_title:, book_url:,)

client.create_page(parent:, properties:,)

