class Post < ApplicationRecord
  has_many :comments
  belongs_to :user

  has_one_attached :image
  after_commit :add_default_image, on: %i[update]

  paginates_per 15

  validates :title, presence: true, length: { minimum: 3, maximum: 50 }
  validates :content, presence: true, length: { minimum: 20 }
  validates :image, content_type: ['image/png', 'image/jpeg', 'image/jpg']

  def image_as_thumbnail
    if image.attached?
      image
    else
      'Spanish.jpg'
    end
  end

  private

  def add_default_image
    return if image.attached?

    image.attach(
      io: File.open(Rails.root.join('app', 'assets', 'images', 'Spanish.jpg')),
      filename: 'Spanish.jpg',
      content_type: 'image/jpg'
    )
  end
end
