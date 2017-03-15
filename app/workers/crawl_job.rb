class CrawlJob
require 'spidr'
require 'uri'

  def perform

  tags_hash = Hash['politics', 1,'finance', 2, 'world', 3, 'article', 4] #to be filled out more
  sorting_hash = Hash['market', 'finance', 'stocks', 'finance', 'Trump', 'politics', 'republican', 'politics']
  keywords = []
  headline = "h1.article-headline"
  main_content = "span#article-text p"
  website = "http://www.reuters.com/"
  i = 0
  
    Spidr.site(website) do |spider|
      spider.every_page do |page|
        url = page.url.to_s
        split_url = url.split('/')
        title = page.search(headline)
        content = page.search(main_content)


        if title.blank? || content.blank?
          #Do not save empty articles
        else
          tags_hash.each do |tag_key, tag_value|
            if split_url.detect { |dir| dir == tag_key }
              sorting_hash.each do |sort_key, sort_value|
                if title.detect { |title_word| title_word == sort_key }
                  keywords.push(sort_key + ', ')
                end
              end
              if i < 5
                article = Article.new(url: url, title: title, content: content, tag: tag_value, sort_value: "keywords", headline: 1)
                article.save!
                i += 1
              else
                article = Article.new(url: url, title: title, content: content, tag: tag_value, sort_value: "keywords", headline: 0)
                article.save!
              end
            end
          end
        end

      end
    end

  end

end
