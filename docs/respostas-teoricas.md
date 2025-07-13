# 📋 Respostas Teóricas - Teste Técnico DevOps

## 🔧 Instalação e Acesso Remoto

### ManageEngine Endpoint Central - Instalação Remota

**Métodos para instalação remota em Windows:**

1. **Group Policy (GPO)**
   - Baixar o MSI do agente no console ManageEngine
   - Colocar o arquivo em compartilhamento de rede (\\servidor\netlogon\)
   - Criar nova GPO em Group Policy Management
   - Ir em Computer Configuration > Software Settings > Software Installation
   - Adicionar o pacote MSI e configurar para instalação automática

2. **PowerShell Remoting**
   ```powershell
   $computers = @("PC001", "PC002", "PC003")
   $credential = Get-Credential
   Invoke-Command -ComputerName $computers -Credential $credential -ScriptBlock {
       $source = "\\servidor\share\ManageEngineAgent.msi"
       Start-Process msiexec.exe -ArgumentList "/i $source /quiet SERVER_NAME=servidor.empresa.com" -Wait
   }

