# encoding: utf-8

class HTML5DemoFormData < WatirModel
  key(:text) do
    { text_field: 'Apple',
      password: 'MyPassword123#1',
      website: 'http://www.google.ca',
      email: 'ferris@bueller.ca',
      phone: '4165555555',
      search: 'Apples',
      number: '10564',
      error: 'Error!',
      valid: 'Valid!',
      text_area: 'This is a long text string with a lot of content in it' }
  end

  key(:checkbox) do
    { checkbox_1: true,
      checkbox_2: false,
      checkbox_3: true }
  end

  key(:radio) do
    { radio_3: true }
  end

  key(:select_list_text)  { { select_list: 'Option Three' } }
  key(:select_list_value) { { select_list: '2' } }
  key(:button)            { { button_btn: true } }
end
