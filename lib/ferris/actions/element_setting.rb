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
        browser.execute_script(js_check(v), self)
        fire_event :change
      when Watir::Select
        browser.execute_script(js_select(v), self)
        fire_event :change
      when Watir::TextField, Watir::TextArea, Watir::Input
        browser.execute_script(js_set(v), self)
        fire_event :change
      else
        browser.execute_script(js_click, self)
      end
    end

    private

    def js_select(v)
      <<-SCRIPT
      {
        var e=arguments[0];
        var val='#{v}';
        for(var ii=0; ii<e.length; ii++)
          if(e.options[ii].value==val || e.options[ii].text==val ) {
            e.options[ii].selected=true;
            return true;
          }
        return false;
      }
      SCRIPT
    end

    def js_check(v)
      <<-SCRIPT
      {
        var e=arguments[0];
        var action= #{v}
        e.checked = action;
        if(action && e.checked) {
          return true;
        } else if(action == false && e.checked == false) {
            return true;
        } else {
            return false;
        }
      }
      SCRIPT
    end

    def js_set(v)
      <<-SCRIPT
      {
        var e=arguments[0];
        var val='#{v}';
        e.value =val;
        if(e.value==val) {
          return true;
        }
        return false;
      }
      SCRIPT
    end

    def js_click
      <<-SCRIPT
      {
        var e=arguments[0];
        e.click();
        return true;
      }
      SCRIPT
    end

  end
end
