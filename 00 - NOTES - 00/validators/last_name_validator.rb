app/validators/what_are_you_validating_validator.rb

class LastNameValidator < ActiveModel::LastNameValidator
    def validate(record)
        unless record.start_with? 'B'
            record.errors.add :name, "B's only, Buster! Buzz off!"
        end
    end
end

~OR~

class EmailValidator < ActiveModel::Validator
    def validate(record)
      unless record.email.match?(/flatironschool.com/)
        record.errors[:email] << "We're only allowed to have people who work for the company in the database!"
      end
    end
  end 

# in Person class model:
class Person
    include ActiveModel::Validations
    validates_with MyValidator
  end