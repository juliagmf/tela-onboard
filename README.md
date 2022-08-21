
# Tela de Onboarding

### Criando o ambiente
Abra o terminal
```
mkdir telas_iniciais
cd telas_iniciais
```
### Criando um projeto
```
flutter create onboarding
```

### Abra o VS Code
```
code .
```
### Assets
Crie a pasta de assets na pasta raiz. Em seguida, adicione as imagens necessárias a esta pasta.

onboarding
    assets

Em seguida, abra o arquivo pubspec.yaml, descomente a pasta de assets e adicione o caminho das imagens

```
assets:
    - assets/


# Adicionando pacote
```

### Shared Preferences

Neste projeto, precisamos do pacote Shared Preferences. Porque a tela de integração aparece apenas uma vez. Usando o pacote de preferências compartilhadas, armazenamos as informações de integração no armazenamento local. Ele informa que o usuário viu a tela de integração ou não. Para obter a versão mais recente, visite a página oficial https://pub.dev/packages/shared_preferences.

Abra o arquivo pubspec.yaml e adicione o pacote Shared Preferences na seção de dependências.

```
dependencies:
  flutter:
    sdk: flutter


  # The following adds the Cupertino Icons font to your application.
  # Use with the CupertinoIcons class for iOS style icons.
  cupertino_icons: ^1.0.2
  shared_preferences: ^2.0.15

```
### Pasta de onboard
Abra a pasta lib e crie a pasta onboard
onboarding
    lib
       onboard

Dentro da pasta onboard crie dois arquivos dart	

onboard
  onboard.dart
  onboard_model.dart


### Google fonts
Instalando o pacote de fontes do Google no Flutter. O primeiro passo é carregar o pacote para fontes do google. Abra o arquivo pubspec.yaml e adicione o pacote de fontes do Google na seção de dependências. Para obter a versão mais recente, visite a página https://pub.dev/packages/google_fonts.

```
dependencies:
  flutter:
    sdk: flutter


  # The following adds the Cupertino Icons font to your application.
  # Use with the CupertinoIcons class for iOS style icons.
  cupertino_icons: ^1.0.2
  shared_preferences: ^2.0.15
  google_fonts: ^3.0.1

#Carregando o pacote Google fonts 
```

### Implementação
main.dart
```

```

Dentro da pasta lib crie um arquivo dart
home.dart	
```

```

Dentro da pasta lib crie um arquivo dart
constant.dart

```

```
lib/onboard
onboard_model.dart

```

```
 lib/onboard
onboard.dart

```

```


### Rodando o projeto
```
flutter run
```

<img src="onboarding/t1.JPG" alt="dr"/>
<img src="t2.JPG" alt="dr"/>
<img src="t3.JPG" alt="dr"/>
