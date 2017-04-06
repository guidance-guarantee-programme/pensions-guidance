class Breadcrumb
  attr_accessor :path, :title

  def initialize(path, title)
    self.path = path
    self.title = title
  end

  class << self
    include Rails.application.routes.url_helpers

    def book_an_appointment
      new('/appointments', 'Book a free appointment')
    end

    def book_online(location_id, location_name)
      new('/locations/' + location_id, location_name)
    end

    def how_to_book_phone
      new('/book-phone', 'How to book a phone appointment')
    end

    def how_to_book_face_to_face
      new('/book-face-to-face', 'Find an appointment location near you')
    end

    def pension_options
      new('/pension-pot-options', 'What you can do with your pot')
    end

    def book_a_telephone_appointment
      new(new_telephone_appointment_path, 'Book a phone appointment')
    end
  end
end
