class Achievement < ApplicationRecord
  belongs_to :user

  validates :title, presence: true, uniqueness: { scope: :user_id }

  enum privacy: %i[public_access private_access friends_access]

  def description_html
    Redcarpet::Markdown.new(Redcarpet::Render::HTML).render(description)
  end
end
