class Achievement < ApplicationRecord
  belongs_to :user

  validates :title, presence: true, uniqueness: { 
    scope: :user_id,
    message: "you can't have two achievements with the same title"
  }

  enum privacy: %i[public_access private_access friends_access]

  def description_html
    Redcarpet::Markdown.new(Redcarpet::Render::HTML).render(description)
  end

  def silly_title
    "#{title} by #{user.email}"
  end

  def self.by_letter(letter)
    includes(:user).where("title like ?", "#{letter}%").order('users.email')
  end
end
