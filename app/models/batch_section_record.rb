# == Schema Information
#
# Table name: batch_section_records
#
#  id         :integer          not null, primary key
#  page_id    :integer          not null
#  content    :text
#  log        :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class BatchSectionRecord < ApplicationRecord
  belongs_to :page

  validates :content, presence: true

  before_save :parse

  # only support h3 as the secton
  def parse
    unless self.log 
      self.log = ""
    end 
    Rails.logger.info("Batch Sections: start parsing the content")
    markdown = Redcarpet::Markdown.new(Redcarpet::Render::HTML, {})
    html = markdown.render(content)
    # Rails.logger.info(html)
    doc = Nokogiri::HTML.parse(html)
    doc.css('h3').each_with_index do |headline, index|
      h3_text = headline.content
      log_msg = "#{h3_text} exists, just skip 🚀\n"
      if not Section.exists?(title: h3_text, page_id: page_id)
        section = Section.new(title: h3_text, page_id: page_id, position: index+1)
        if section.save
          log_msg = "#{h3_text} ✅\n"
        else
          log_msg = "#{h3_text} ❌\n"
        end 
      end #if 
      self.log += log_msg

    end #each
  end

end
