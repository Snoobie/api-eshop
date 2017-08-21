module Modules
  module Valid

    def self.request(object, params)
      object.attributes = params
      unless object.valid?
        errors = Hash.new
        object.errors.messages.each do |k, v|
          errors = errors.merge({k => v[0]})
        end
        return errors
      end
      object.save
      return object
    end

  end
end
