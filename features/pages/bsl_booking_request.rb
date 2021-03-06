require_relative 'page'

module Pages
  class BslBookingRequest < Page
    set_url '/en/bsl-booking-requests/new'

    element :first_name, '.t-first-name'
    element :last_name, '.t-last-name'
    element :email, '.t-email'
    element :phone, '.t-phone'
    element :memorable_word, '.t-memorable-word'
    element :day_of_birth, '.t-date-of-birth-day'
    element :month_of_birth, '.t-date-of-birth-month'
    element :year_of_birth, '.t-date-of-birth-year'
    element :defined_contribution_pot_confirmed_yes, '.t-dc-pot-1', visible: false
    element :accessibility_needs, '.t-accessibility-needs', visible: false
    element :additional_info, '.t-additional-info'
    element :where_you_heard, '.t-where-you-heard'
    element :gdpr_consent_yes, '.t-gdpr-consent-yes', visible: false

    element :supported_yes, '.t-supported-yes', visible: false
    element :supported_no, '.t-supported-no', visible: false
    element :support_name, '.t-support-name'
    element :support_relationship, '.t-support-relationship'
    element :support_email, '.t-support-email'
    element :support_phone, '.t-support-phone'

    element :submit, '.t-submit'

    elements :errors, '.form-group-error'
  end
end
