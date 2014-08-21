module Spree
  class PageImage < Spree::Asset

    has_attached_file :attachment,
      :url => '/spree/pages/:id/:style/:basename.:extension',
      :path => ':rails_root/public/spree/pages/:id/:style/:basename.:extension'

    def image_content?
      attachment_content_type.to_s.match(/\/(jpeg|png|gif|tiff|x-photoshop)/)
    end

  end
end