# !/usr/bin/env ruby

class IntroducaoScreen
  def initialize
    @next_button = 'next_onboarding_button'
    @finish_button = 'finish_onboarding_button'
    @label_texto = 'section_label'
    @option_login = '//android.widget.TextView[@text="LOGIN"]'
    @jump_button = 'jump_onboarding_button'
  end

  def avancar_introducao
    find_element(id: @next_button).click
  end

  def finalizar_introducao
    # wait_for_element(id: @finish_button)
    # find_element(id: @finish_button).click
    wait_for_click(id: @finish_button)
  end

  def pular_introducao
    wait_for_click(id: @jump_button, timeout: 1)
  end
end
