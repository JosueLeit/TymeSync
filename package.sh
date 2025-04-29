#!/bin/bash

# Cria diretório temporário
mkdir -p TimeSync

# Copia arquivos necessários
cp sync_time.bat TimeSync/
cp install_task.bat TimeSync/
cp uninstall_task.bat TimeSync/
cp README.md TimeSync/
cp LICENSE.txt TimeSync/

# Cria arquivo de instruções específico para Windows
cat > TimeSync/INSTALACAO.txt << EOL
INSTRUÇÕES DE INSTALAÇÃO
=======================

1. Extraia todos os arquivos deste ZIP para uma pasta
2. Clique com o botão direito em "install_task.bat"
3. Selecione "Executar como administrador"
4. Siga as instruções na tela

Para desinstalar:
1. Clique com o botão direito em "uninstall_task.bat"
2. Selecione "Executar como administrador"

Observações:
- É necessário executar como administrador
- O Windows pode mostrar um aviso de segurança, clique em "Mais informações" e "Executar mesmo assim"
- Certifique-se de que o serviço "Windows Time" está em execução
EOL

# Cria o arquivo ZIP
zip -r TimeSync.zip TimeSync/

# Limpa o diretório temporário
rm -rf TimeSync

echo "Arquivo TimeSync.zip criado com sucesso!" 