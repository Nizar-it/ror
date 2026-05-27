class Post < ApplicationRecord

    include Sluggable;
    belongs_to :category, counter_cache: true
    has_and_belongs_to_many :tags
    has_many :metas, as: :mettaable

    default_scope { order(created_at: :desc) }
    scope :online, -> { where(online: 1) }

    def as_json(options = nil)
        super(only: [:name, :id, :created_at])
    end

    validates :name, format: { with: /\A[a-zA-Z]+\z/ }
    
    validates :name, uniqueness: true

    validates :name, length: { is: 2 }, if: :check_content_2
    def check_content_2
        content.length == 2
    end

    validate :ma_super_method_de_validation
    def ma_super_method_de_validation
        if name.length != 2
            errors.add(:name, 'Le champs doit être de 2 caractères')
        end
    end

    validate :ma_super_method_de_validation
    def ma_super_method_de_validation
        if name.nil? || name.length != 2
            errors.add(:name, :not_2, { message: 'Le champs doit être de 2 caractères' })
        end
        if content.nil? || content.length !=2
            errors.add(:content, 'Le champs doit être de 2 caractères')
        end
    end
end