# encoding: utf-8

class HTML5DemoFormData < WatirModel
  key(:text_input) do
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

  key(:text_output) do
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

  key(:select_input) { { select_list: 'Option Two' } }
  key(:select_output) { { select_list: 'Option Two' } }

  key(:checkbox_input) do
    { checkbox_1: true,
      checkbox_2: false,
      checkbox_3: true }
  end

  key(:checkbox_output) do
    { checkbox_1: true,
      checkbox_2: false,
      checkbox_3: true }
  end

  key(:radio_input) do
    { radio_1: true,
      radio_2: false,
      radio_3: true }
  end

  key(:radio_output) do
    { radio_1: false,
      radio_2: false,
      radio_3: true }
  end

  key(:button_input) do
    { submit_btn: true,
      button_btn: false,
      reset_btn: true }
  end
end
