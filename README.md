# TimeSync - Sincronizador de Horário para Windows

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
[![Windows](https://img.shields.io/badge/Windows-0078D6?style=flat&logo=windows&logoColor=white)](https://www.microsoft.com/windows)

Este é um script simples para sincronizar automaticamente o horário do Windows em computadores sem bateria ou com problemas de sincronização de horário.

## Características

- Usa ferramentas nativas do Windows
- Não requer instalação de software adicional
- Fácil de configurar
- Gratuito e open source
- Sincronização automática a cada hora
- Logs de operação para monitoramento

## Download

Baixe a última versão em: [Releases](https://github.com/JosueLeit/TymeSync/releases)

## Instalação Rápida

1. Baixe o arquivo `TimeSync.zip` da seção de releases
2. Extraia o arquivo ZIP
3. Clique com o botão direito em `install_task.bat`
4. Selecione "Executar como administrador"
5. Siga as instruções na tela

## Desinstalação

1. Clique com o botão direito em `uninstall_task.bat`
2. Selecione "Executar como administrador"

## Requisitos

- Windows 7 ou superior
- Conexão com a internet
- Privilégios de administrador

## Solução de Problemas

Se o horário não estiver sincronizando:
1. Verifique se o serviço "Windows Time" está em execução:
   - Pressione Windows + R
   - Digite `services.msc` e pressione Enter
   - Procure por "Windows Time"
   - Certifique-se que está "Em execução"

2. Verifique se o computador tem acesso à internet

3. Tente executar o script manualmente para ver se há mensagens de erro

## Contribuição

Contribuições são bem-vindas! Sinta-se à vontade para:
1. Abrir issues para reportar bugs ou sugerir melhorias
2. Enviar pull requests com correções ou novas funcionalidades
3. Melhorar a documentação

## Licença

Este projeto está licenciado sob a licença MIT - veja o arquivo [LICENSE](LICENSE.txt) para mais detalhes.

## Segurança

Este projeto:
- Usa apenas ferramentas nativas do Windows
- Não requer instalação de software adicional
- Não coleta dados do usuário
- Não faz alterações permanentes no sistema
- Pode ser desinstalado completamente

## Sobre o Platypus

O Platypus é uma ferramenta do macOS que permite criar aplicativos a partir de scripts. No entanto, como este projeto é específico para Windows, não precisamos usar o Platypus. O arquivo ZIP que fornecemos contém todos os arquivos necessários para instalação no Windows.

## Histórico de Versões

### v1.0.0
- Lançamento inicial
- Sincronização automática a cada hora
- Scripts de instalação e desinstalação
- Documentação completa

## Instalação Automática (Recomendado)

1. Baixe os arquivos `sync_time.bat` e `install_task.bat`
2. Clique com o botão direito em `install_task.bat` e selecione "Executar como administrador"
3. Aguarde a mensagem de sucesso

## Desinstalação

1. Baixe o arquivo `uninstall_task.bat`
2. Clique com o botão direito em `uninstall_task.bat` e selecione "Executar como administrador"
3. Aguarde a mensagem de sucesso

## Instalação Manual

Se preferir configurar manualmente:

1. Baixe o arquivo `sync_time.bat`
2. Abra o "Agendador de Tarefas" do Windows:
   - Pressione Windows + R
   - Digite `taskschd.msc` e pressione Enter

3. No Agendador de Tarefas:
   - Clique em "Criar Tarefa Básica" no painel direito
   - Nome: "Sincronizar Horário"
   - Descrição: "Sincroniza o horário do sistema automaticamente"
   - Clique em "Avançar"

4. Configure o gatilho:
   - Selecione "Diariamente"
   - Configure para executar a cada hora
   - Clique em "Avançar"

5. Configure a ação:
   - Selecione "Iniciar um programa"
   - Clique em "Procurar" e selecione o arquivo `sync_time.bat`
   - Clique em "Avançar"

6. Revise as configurações e clique em "Concluir"

## Desinstalação Manual

1. Abra o "Agendador de Tarefas" do Windows
2. Procure por "Sincronizar Horário" na lista de tarefas
3. Clique com o botão direito e selecione "Excluir"
4. Confirme a exclusão

## Verificação

Para verificar se a tarefa está funcionando:
1. Abra o "Agendador de Tarefas"
2. Procure por "Sincronizar Horário" na lista de tarefas
3. Verifique se o status está como "Pronto"

## Solução de Problemas

Se o horário não estiver sincronizando:
1. Verifique se o serviço "Windows Time" está em execução:
   - Pressione Windows + R
   - Digite `services.msc` e pressione Enter
   - Procure por "Windows Time"
   - Certifique-se que está "Em execução"

2. Verifique se o computador tem acesso à internet

3. Tente executar o script manualmente para ver se há mensagens de erro

4. Se a instalação automática falhar:
   - Certifique-se de executar como administrador
   - Tente a instalação manual
   - Verifique se o arquivo `sync_time.bat` está no mesmo diretório que `install_task.bat`
