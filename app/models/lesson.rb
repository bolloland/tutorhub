class Lesson < ApplicationRecord
    belongs_to :student
    belongs_to :tutor

    validates :location, :address_1, :meeting_time, :topic, presence: true

    scope :order_by_date, -> {order('meeting_time')}
    #validations!

    # def self.order_by_date
    #     order('meeting_time')
    # end
end
