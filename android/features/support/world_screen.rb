# encoding: utf-8
# !/usr/bin/env ruby

Dir[File.join(File.dirname(__FILE__), '../screens/*_screen.rb')].each { |file| require file }

module Screen
  def tela_introducao
    @introducao ||= IntroducaoScreen.new
  end
end