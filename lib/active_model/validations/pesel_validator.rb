module ActiveModel
  module Validations
    class PeselValidator < ActiveModel::EachValidator
      def validate_each(record, attr_name, value)
        record.errors.add(attr_name, :invalid, **options) if !value.blank? && !Activepesel::Pesel.new(value).valid?
      end
    end
  end
end
