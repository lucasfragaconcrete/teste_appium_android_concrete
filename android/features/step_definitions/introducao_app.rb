Dado('que eu esteja na primeira tela de introducao') do
  @introducao_textos = find_element(:id, 'section_label')
  expect(@introducao_textos.text)
    .to include 'Simulados inéditos do ENEM com correção TRI!'
end

Quando('eu avancar ate a ultima introducao') do
  tela_introducao.avancar_introducao
  expect(@introducao_textos.text)
    .to include 'Mais de 40 mil questões dos principais vestibulares!'

  tela_introducao.avancar_introducao
  expect(@introducao_textos.text)
    .to include 'Comparação com o desempenho de alunos de todo Brasil!'

  tela_introducao.finalizar_introducao
end

Entao('eu verifico a tela de login com sucesso') do
  @verificar_texto = find_element(:xpath, '//android.widget.TextView[@text="LOGIN"]')
  expect(@verificar_texto.text)
    .to include 'LOGIN'
end

Quando('eu pular a introducao') do
  tela_introducao.pular_introducao
end