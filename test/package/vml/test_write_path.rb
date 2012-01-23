# -*- coding: utf-8 -*-
require 'helper'
require 'write_xlsx/workbook'
require 'write_xlsx/package/vml'

class TestWritePath < Test::Unit::TestCase
  def test_write_path
    vml = Writexlsx::Package::Vml.new
    vml.__send__('write_path', 't', 'rect')
    result = vml.instance_variable_get(:@writer).string
    expected = '<v:path gradientshapeok="t" o:connecttype="rect" />'
    assert_equal(expected, result)
  end

  def test_write_path_without_gradientshapeok
    vml = Writexlsx::Package::Vml.new
    vml.__send__('write_path', nil, 'none')
    result = vml.instance_variable_get(:@writer).string
    expected = '<v:path o:connecttype="none" />'
    assert_equal(expected, result)
  end
end
