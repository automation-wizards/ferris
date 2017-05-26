class Hero < Ferris::Region
  element(:apply_btn) { root.link(class: 'apply') }
  element(:sponsor_btn) { root.link }
end
