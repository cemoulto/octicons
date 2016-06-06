require 'minitest/autorun'
require 'octicons'

class OcticonTest < Minitest::Test

  include Octicons::Helpers

  def test_wrong_symbol_raises_alert
    assert_raises(RuntimeError) do
      octicon(:symbol => "octicon")
    end
  end

  def test_classes_are_set_on_rendered_svg
    icon = octicon(:symbol => "x", :class => "text-closed")
    assert_includes icon, "class=\"octicon octicon-x text-closed\""
  end

  def test_render_with_other_html_attributes
    icon = octicon(:symbol => "x", :class => "right", :'aria-label' => "Close")
    assert_includes icon, "class=\"octicon octicon-x right\""
    assert_includes icon, "aria-label=\"Close\""
  end

  def test_render_with_accessibility_attributes
    icon = octicon(:symbol => "x", :'aria-label' => "Close")
    assert_includes icon, "role=\"img\""
    assert_includes icon, "aria-label=\"Close\""
  end

  def test_render_with_aria_hidden_when_no_aria_label_is_present
    icon = octicon(:symbol => "x")
    assert_includes icon, "aria-hidden=\"true\""
  end

  def test_always_have_width_and_height
    icon = octicon(:symbol => "x")
    assert_includes icon, "height=\"16\""
    assert_includes icon, "width=\"12\""
  end

  def test_always_have_viewbox
    icon = octicon(:symbol => "x")
    assert_includes icon, "viewBox=\"0 0 12 16\""
  end

  def test_large_passed_in_as_size_makes_the_icon_the_correct_size
    icon = octicon(:symbol => "x", :size => "large")
    assert_includes icon, "height=\"32\""
  end

  def test_render_with_integer_calculates_correctly
    icon = octicon(:symbol => "x", :size => 60)
    assert_includes icon, "height=\"60\""
    assert_includes icon, "width=\"45\""
  end

  def test_render_with_width_and_height_passed_in
    icon = octicon(:symbol => "x", :width => 60, :height => 60)
    assert_includes icon, "width=\"60\""
    assert_includes icon, "height=\"60\""
  end
end
