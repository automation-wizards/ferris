module Watir
  class Element
    def do(v = nil)
      case self
      when Watir::Radio
        set if v
      when Watir::CheckBox
        v ? set : clear
      when Watir::Select
        begin
          select v
        rescue Watir::Exception::NoValueFoundException
          select_value v
        end
      when Watir::TextField, Watir::TextArea, Watir::Input
        set v
      else
        click
      end
    end

    def do!(v = nil)
      wait_for_exists
      case self
      when Watir::CheckBox, Watir::Radio
        browser.execute_script("arguments[0].checked = #{v ? 'true' : 'false'};", self)
      when Watir::Select, Watir::TextField, Watir::TextArea, Watir::Input
        browser.execute_script("arguments[0].value = '#{v}';", self)
      else
        browser.execute_script('arguments[0].click();', self)
      end
    end
  end
end
