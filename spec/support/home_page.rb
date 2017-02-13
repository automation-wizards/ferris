class HomePage < Ferris::Core
  partial_url           {"/wiki/Main_Page"}
  element(:search_term) { browser.text_field(id: 'searchInput')}
  element(:submit_btn)  { browser.button(name: 'go')}

  def search(input)
    search_term.set input
    submit_btn.click
  end
end
