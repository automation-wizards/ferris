class ElementsPage < Ferris::Page

  partial_url { '/index.html' }
  title { 'HTML5 Test Page' }

  # Inputs
  element(:text_field) { browser.text_field(id: 'input__text') }
  element(:password)   { browser.text_field(id: 'input__password') }
  element(:website)    { browser.text_field(id: 'input__webaddress') }
  element(:email)      { browser.text_field(id: 'input__emailaddress') }
  element(:phone)      { browser.text_field(id: 'input__phone') }
  element(:search)     { browser.text_field(id: 'input__search') }
  element(:number)     { browser.text_field(id: 'input__text2') }
  element(:error)      { browser.text_field(id: 'input__text3') }
  element(:valid)      { browser.text_field(id: 'input__text4') }

  # Select Lists
  element(:select_list) { browser.select_list(id: 'select') }

  # Checkboxes
  element(:checkbox_1) { browser.checkbox(id: 'checkbox1') }
  element(:checkbox_2) { browser.checkbox(id: 'checkbox2') }
  element(:checkbox_3) { browser.checkbox(id: 'checkbox3') }

  # Radio Buttons
  element(:radio_1) { browser.radio(id: 'radio1') }
  element(:radio_2) { browser.radio(id: 'radio2') }
  element(:radio_3) { browser.radio(id: 'radio3') }

  # Text Area
  element(:text_area) { browser.textarea(id: 'textarea') }

  # Buttons
  element(:submit_btn) { browser.button(type: 'submit') }
  element(:button_btn) { browser.button(type: 'button') }
  element(:reset_btn)  { browser.button(type: 'reset') }

  def ensure_loaded
    puts 'I am a page'
  end
end
