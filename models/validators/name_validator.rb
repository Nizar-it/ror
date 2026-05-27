class NameValidator < ActiveModel::EachValidator

    def validate_each(record, attribute, value)
        if value.nil? || value.length < 2
            message = options[:message] || 'doit avoir 2 caractères'
            record.errors.add(attribute, message)
        end
    end

    def validate(record)
        if record.name.nil? || record.name.length != 2
            record.errors.add(:name, :not_2, { message: 'Le champs doit être de 2 caractères' })
        end
        if record.content.nil? ||record.content.length != 2
            record.errors.add(:content, 'Le champs doit être de 2 caractères')
        end
    end
end