module Pg
  class El < Ferris::Page

  partial_url { '/index.html' }
  title { 'HTML5 Test Page' }
  
  el(:links)     { b.links}
  # Inputs
  el(:text_field) { b.text_field(id: 'input__text') }
  el(:password)   { b.text_field(id: 'input__password') }
  el(:website)    { b.text_field(id: 'input__webaddress') }
  el(:email)      { b.text_field(id: 'input__emailaddress') }
  el(:phone)      { b.text_field(id: 'input__phone') }
  el(:search)     { b.text_field(id: 'input__search') }
  el(:number)     { b.text_field(id: 'input__text2') }
  el(:error)      { b.text_field(id: 'input__text3') }
  el(:valid)      { b.text_field(id: 'input__text4') }

  # Select Lists
  el(:select_list) { b.select_list(id: 'select') }

  # Checkboxes
  el(:checkbox_1) { b.checkbox(id: 'checkbox1') }
  el(:checkbox_2) { b.checkbox(id: 'checkbox2') }
  el(:checkbox_3) { b.checkbox(id: 'checkbox3') }

  # Radio Buttons
  el(:radio_1) { b.radio(id: 'radio1') }
  el(:radio_2) { b.radio(id: 'radio2') }
  el(:radio_3) { b.radio(id: 'radio3') }

  # Text Area
  el(:text_area) { b.textarea(id: 'textarea') }

  # Buttons
  el(:submit_btn) { b.button(type: 'submit') }
  el(:button_btn) { b.button(type: 'button') }
  el(:reset_btn)  { b.button(type: 'reset') }
  end
end
