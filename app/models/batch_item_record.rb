# == Schema Information
#
# Table name: batch_item_records
#
#  id         :integer          not null, primary key
#  section_id :integer          not null
#  content    :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  log        :text
#
class BatchItemRecord < ApplicationRecord
  belongs_to :section

  validates :content, presence: true

  before_save :parse

  # content is a markdown text
  # first render it to html
  # then parse the html and create items
  def parse
    unless self.log 
      self.log = ""
    end 
    Rails.logger.info("Batch Items: start parsing the content")
    markdown = Redcarpet::Markdown.new(Redcarpet::Render::HTML, {})
    html = markdown.render(content)
    # Rails.logger.info(html)
    doc = Nokogiri::HTML.parse(html)
    doc.css('li').each_with_index do |list_item, index|
      link = list_item.css('a').first 
      if link
        link_href = link.attribute('href')
        link_text = link.content
        desc = list_item.content.gsub(link_text, "").strip || link_text
        # Rails.logger.info("#{link_text}: #{link_href}, description: #{desc}")
        log_msg = "#{link_text} exists, just skip 🚀\n"
        if not Item.exists?(link_name: link_text, section_id: section_id)
          item = Item.new(link_name: link_text, link_href: link_href, 
                          description: desc, section_id: section_id, 
                          position: index+1)
          if item.save
            log_msg = "#{link_text} ✅\n"
          else
            log_msg = "#{link_text} ❌\n"
          end 
        end #if 
        self.log += log_msg
      end #if link 
    end #each
  end

end
